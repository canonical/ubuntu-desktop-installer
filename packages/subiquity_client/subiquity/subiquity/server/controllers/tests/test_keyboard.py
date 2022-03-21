# Copyright 2019 Canonical, Ltd.
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

import asyncio
import os
import tempfile
import unittest

from subiquity.models.keyboard import (
    KeyboardModel,
    )
from subiquity.server.controllers.keyboard import (
    KeyboardController,
    )
from subiquity.common.types import KeyboardSetting


class opts:
    dry_run = True


class TestSubiquityModel(unittest.TestCase):

    def test_write_config(self):
        loop = asyncio.new_event_loop()
        policy = asyncio.get_event_loop_policy()
        watcher = asyncio.SafeChildWatcher()
        watcher.attach_loop(loop)
        policy.set_child_watcher(watcher)

        async def t():
            os.environ['SUBIQUITY_REPLAY_TIMESCALE'] = '100'
            with tempfile.TemporaryDirectory() as tmpdir:
                new_setting = KeyboardSetting('fr', 'azerty')
                model = KeyboardModel(tmpdir)
                model.setting = new_setting
                c = object.__new__(KeyboardController)
                c.opts = opts
                c.model = model
                await c.set_keyboard()
                read_setting = KeyboardModel(tmpdir).setting
                self.assertEqual(new_setting, read_setting)
        loop.run_until_complete(t())
        loop.close()
