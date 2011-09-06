@echo off
REM Windows basic shell
REM prepares host system environment for XMLSH
REM see also /bin/boot, which prepares the XMLSH environment
REM
REM these variables may be redefined in private settings
set XROOT=%CD:\=/%

REM hfs root directories
set HOMEDIR=%XROOT%/home
set OPTDIR=%XROOT%/opt
if not exist %OPTDIR% (
  mkdir %XROOT:/=\%\opt
)
set TEMPDIR=%XROOT%/tmp
if not exist %TEMPDIR% (
  mkdir %XROOT:/=\%\tmp
)
set USRDIR=%XROOT%/usr
set VARDIR=%XROOT%/var
if not exist %VARDIR% (
  mkdir %VARDIR:/=\%\log
)
REM hfs dps directories
set BINDIR=%XROOT%/opt/dps/bin
set ETCDIR=%XROOT%/opt/dps/etc
set LIBDIR=%XROOT%/opt/dps/lib
set SBINDIR=%XROOT%/opt/dps/sbin

REM XMLSH settings
set XMLSH=%OPTDIR%/xmlsh_1_1_4
set PATH=%XMLSH%/win32;%PATH%
set XPATH=%XROOT%/usr/bin;%SBINDIR%;%BINDIR%
set XLOGFILE=%XROOT%/var/log/xmlsh.log

REM at a minimum, XMLSH required

if not exist %XMLSH% (
  echo "setenv: %XMLSH% not found. Install XMLSH. See README."
)

echo "Booting DPS"
xmlsh -rcfile boot.xsh

exit /B