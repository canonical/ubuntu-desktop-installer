#!/usr/bin/python3

import json
import os
import sys
import time

from systemd import journal

json_file = sys.argv[1]
event_identifier = sys.argv[2]
log_location = sys.argv[3]

scale_factor = float(os.environ.get('SUBIQUITY_REPLAY_TIMESCALE', "4"))

def time_for_entry(e):
    return int(e['__MONOTONIC_TIMESTAMP'])/1e6

rc = 0

def report(e, log_file):
    global rc
    if e['SYSLOG_IDENTIFIER'].startswith("curtin_event"):
        e['SYSLOG_IDENTIFIER'] = event_identifier
        e['CODE_LINE'] = int(e['CODE_LINE'])
        journal.send(**e)
        r = e.get("CURTIN_RESULT")
        if r == "SUCCESS":
            rc = 0
        elif r == "FAIL":
            rc = 1
    elif e['SYSLOG_IDENTIFIER'].startswith("curtin_log") and scale_factor < 10:
        print(e['MESSAGE'], flush=True)
        log_file.write(e['MESSAGE'] + '\n')

with open(log_location, 'w') as fp:
    prev_ev = None
    for line in open(json_file):
        ev = json.loads(line.strip())
        if prev_ev is not None:
            report(prev_ev, fp)
            delay = time_for_entry(ev) - time_for_entry(prev_ev)
            time.sleep(min(delay, 8)/scale_factor)
        prev_ev = ev
    report(ev, fp)

sys.exit(rc)
