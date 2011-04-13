#!/bin/bash
# prepares host shell environment for XMLSH
# see also sbin/boot, which prepares the XMLSH environment
# see also sbin/kickstart, which installs required packages
#

#"SCRIPT_PATH"
#Copyleft, selectable license under the GPL2.0 or later or CC-SA 3.0 (CreativeCommons Share Alike) or later.
#http://www.gnu.org/licenses/gpl-2.0.txt
#http://creativecommons.org/licenses/by-sa/3.0/
#18eedfe1c99df68dc94d4a94712a71aaa8e1e9e36cacf421b9463dd2bbaa02906d0d6656
SCRIPT_PATH="${BASH_SOURCE[0]}";
if([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null
#"SCRIPT_PATH"

export DPSDIR=$SCRIPT_PATH

#hfs root directories
export HOMEDIR=$PWD/home
export OPTDIR=$PWD/opt ; [ ! -e $OPTDIR ] && mkdir $OPTDIR
export TEMPDIR=$PWD/tmp ; [ ! -e $TEMPDIR ] && mkdir $TEMPDIR
export USRDIR=$PWD/usr
export VARDIR=$PWD/var ; [ ! -e $VARDIR ] && mkdir -p $VARDIR/log
#hfs dps directories
export BINDIR=$DPSDIR/bin
export ETCDIR=$DPSDIR/etc
export LIBDIR=$DPSDIR/lib
export SBINDIR=$DPSDIR/sbin

# XMLSH settings
export XMLSH=$OPTDIR/xmlsh_1_1_4
export PATH=$XMLSH/unix:$PATH
export XPATH=$PWD/usr/bin:$SBINDIR:$BINDIR
export XLOGFILE=$PWD/var/log/xmlsh.log

# at a minimum, XMLSH required
[ ! -e $XMLSH ] && { 
  echo "setenv: $XMLSH not found"
  echo "attempting to install"
  ftp -o  $OPTDIR/xmlsh_1_1_4.zip http://downloads.sourceforge.net/project/xmlsh/xmlsh/1.1.4/xmlsh_1_1_4.zip
  wait
  unzip $OPTDIR/xmlsh_1_1_4.zip -d $OPTDIR
  sudo chmod u+x $OPTDIR/xmlsh_1_1_4/unix/xmlsh
  echo ""
  echo "Run '. setenv' again."
  return 1 
}

# load private settings (varies with account; may contain private information)
#if [ "$HOSTNAME" == "my.hostname" ]; then
#  export JAVA_HOME=/path-to/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
#  export XEP=/path-to/lib/XEP
#fi
[ -f .setenv ] && . .setenv

echo Booting XMLSH
xmlsh -rcfile $SBINDIR/boot
