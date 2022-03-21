# Copyright 2015 Canonical, Ltd.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

import logging
import os

from subiquitycore.file_util import set_log_perms


def setup_logger(dir, base='subiquity'):
    os.makedirs(dir, exist_ok=True)
    # Create the log directory in such a way that users in the group may
    # write to this directory in the installation environment.
    set_log_perms(dir, isdir=True, group_write=True)

    logger = logging.getLogger("")
    logger.setLevel(logging.DEBUG)

    r = {}

    for level in 'info', 'debug':
        nopid_file = os.path.join(dir, "{}-{}.log".format(base, level))
        logfile = "{}.{}".format(nopid_file, os.getpid())
        handler = logging.FileHandler(logfile)
        set_log_perms(logfile, isdir=False, group_write=False)
        # os.symlink cannot replace an existing file or symlink so create
        # it and then rename it over.
        tmplink = logfile + ".link"
        os.symlink(os.path.basename(logfile), tmplink)
        os.rename(tmplink, nopid_file)

        handler.setLevel(getattr(logging, level.upper()))
        handler.setFormatter(
            logging.Formatter(
                "%(asctime)s %(levelname)s %(name)s:%(lineno)d %(message)s"))

        logger.addHandler(handler)
        r[level] = logfile

    return r
