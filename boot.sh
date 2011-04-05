#!/bin/bash
# prepares host system environment for XMLSH
# see also /bin/boot, which prepares the XMLSH environment
#
# these variables may be redefined in private settings
export XROOT=$PWD

#hfs root directories
export BINDIR=$XROOT/dps/bin
export ETCDIR=$XROOT/dps/etc
export HOMEDIR=$XROOT/home
export LIBDIR=$XROOT/dps/lib
export OPTDIR=$XROOT/opt ; [ ! -e $OPTDIR ] && mkdir $OPTDIR
export SBINDIR=$XROOT/dps/sbin
export TEMPDIR=$XROOT/tmp ; [ ! -e $TEMPDIR ] && mkdir $TEMPDIR
export USRDIR=$XROOT/usr
export VARDIR=$XROOT/var ; [ ! -e $VARDIR ] && mkdir -p $VARDIR/log

# XMLSH settings
export XMLSH=$OPTDIR/xmlsh_1_1_4
export PATH=$XMLSH/unix:$PATH
export XPATH=$XROOT/usr/bin:$SBINDIR:$BINDIR
export XLOGFILE=$XROOT/var/log/xmlsh.log

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
