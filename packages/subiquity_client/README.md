# subiquity_client

Supported environment variables:

| Name | Value | Description |
|---|---|---|
| SUBIQUITY_MODE | <li>`live`: Start Subiquity in live mode</li><li>`dry-run`: Start Subiquity in dry-run mode (default)</li><li>`none`: Do not start Subiquity</li> | Whether Subiquity server is automatically started in live or dry-run mode. |
| SUBIQUITY_PATH | For example: <li>`/home/user/dev/subiquity`</li> | Start Subiquity from the specified location. Defaults to the `subiquity_client/subiquity` submodule. |
| SUBIQUITY_SOCKET_PATH | For example: <li>`/tmp/subiquity.sock`</li> | Use the specified socket to communicate with Subiquity. Defaults to `/run/subiquity/socket` in live, and `.subiquity/socket` in dry-run mode. |
