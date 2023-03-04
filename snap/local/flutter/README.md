The `shader_lib` directory contains Flutter engine artifacts that are missing
for arm64. The files are platform-agnostic GLSL files that have been copied
from the x64 tarball.

The files can be updated to the latest stable by running `update-artifacts.sh`
or to a specific version by running `update-artifacts.sh x.y.z`. The script
downloads the given Flutter release, extracts `shader_lib` from it, and updates
the local copy.

See:
- https://github.com/canonical/ubuntu-desktop-installer/issues/1519
- https://github.com/flutter/flutter/issues/116703#issuecomment-1403956612
- https://github.com/flutter/engine/tree/main/impeller/compiler/shader_lib
