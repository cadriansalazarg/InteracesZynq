#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/carlositcr/InterfacesZynq/GapJuntion/hls/hls_GapJuntion/hls_gapjuntion_prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
