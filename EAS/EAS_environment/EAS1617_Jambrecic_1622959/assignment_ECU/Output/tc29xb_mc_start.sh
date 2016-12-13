#! /bin/bash
# script to start debugger for core_0.
# other core(s) will be started by practice script

set -e

P1_PORT=10000
P2_TITLE=Tricore_CORE0
P3_TMP=C:/Temp
P4_SYS=C:/T32
P5_HELP=C:/T32/pdf
P10_SCRIPT=t32_tc29xb_mc_ram.cmm
P11_ARCH=windows64

if [ "$1" == "" ]; then
  P6_PBI=USB
  P7_OPT=CORE=1
  P8_OPT=
  P9_OPT=
else
  P6_PBI=NET
  P7_OPT=NODE=${1}
  P8_OPT=PACKLEN=1024
  P9_OPT=CORE=1
fi

#-o option is valid in Linux and Cygwin (not in BSD)
unamestr=`uname -o`

if [[ "$unamestr" == 'Cygwin' ]]; then
T32_BASE_DIR=$P4_SYS/bin/$P11_ARCH
else
# Maybe here I should use P11_ARCH the same
T32_BASE_DIR=$P4_SYS/bin/pc_linux
fi

$T32_BASE_DIR/t32mtc -c config_tc29xb_mc.t32 $P1_PORT $P2_TITLE $P3_TMP $P4_SYS $P5_HELP $P6_PBI $P7_OPT $P8_OPT $P9_OPT -s $P10_SCRIPT

