# ubiquitous
import commands p=posix
declare namespace xlink=http://www.w3.org/1999/xlink
declare namespace xi=http://www.w3.org/2001/XInclude
declare namespace svg=http://www.w3.org/2000/svg
declare namespace m=http://www.w3.org/1998/Math/MathML
declare namespace l=http://docbook.sourceforge.net/xmlns/l10n/1.0
declare namespace html=http://www.w3.org/1999/xhtml
declare namespace fo=http://www.w3.org/1999/XSL/Format
declare namespace db=http://docbook.org/ns/docbook
declare namespace fn=http://www.w3.org/2005/xpath-functions
set +indent

# important dps directories and filesz
#dps root directories
UPUB=$(xfile $HOMEDIR); [ ! -d $UPUB ] && p:mkdir -p $UPUB
USRREV=$(xfile $HOMEDIR/doc-review); [ ! -d $USRREV ] && p:mkdir -p $USRREV
USRREL=$(xfile $HOMEDIR/doc-release); [ ! -d $USRREL ] && p:mkdir -p $USRREL

#libaries
SYSRNG=$LIBDIR/relax-ng
SYSXSD=$LIBDIR/xsd
SYSXSL=$LIBDIR/xslt
USRXSL=$USRDIR/lib/xslt
USRETC=$USRDIR/etc
XSLFO=$OPTDIR/docbook-xslt2/release/2.0.0/xslt/base

#catalogs
CATNAME='catalog.xml'
DCATNAME='dcatalog.xml'
SYSCAT=$ETCDIR/$CATNAME
SYSDCAT=$ETCDIR/$DCATNAME
USRDCAT=$USRDIR/etc/$DCATNAME
[ -f $USRDIR/etc/pdict.xml ] && PDICT=$USRDIR/etc/pdict.xml || PDICT=$ETCDIR/pdict.xml
#TODO: use catalogs!
#[ -d $OPTDIR/docbook-5.0 ] && DB5SCH=$OPTDIR/docbook-5.0 || throw "boot: Docbook Schemas not found"

# PROFILES must also set manually in xsl templates! AVT not allowed for template matches.
ROOTS="article book part set reference"
SGML_CATALOG_FILES=$SYSCAT:$USRDIR/etc/$CATNAME
TARGDIR=$VARDIR/etc/targets/
DERROR=$TEMPDIR/error.txt

# cleanup
clean

# sanity check
echo "Performing Sanity Check"
# ensure required files are available; download otherwise
if [ ! -d $OPTDIR/dps ] ; then
  echo "$OPTDIR/dps not found."
  echo "Please be patient as it is downloaded..."
  git clone git://github.com/davidpriest/dps.git $OPTDIR/dps
  wait
fi
if [ ! -d $OPTDIR/docbook-5.0 ] ; then
  echo "$OPTDIR/docbook-5.0 not found."
  echo "Please be patient as it is downloaded..."
  http -get http://www.docbook.org/xml/5.0/docbook-5.0.zip > $OPTDIR/docbook-5.0.zip
  wait
  xunzip -f $OPTDIR/docbook-5.0.zip -d $OPTDIR
fi
if [ ! -d $OPTDIR/docbook-xslt2 ] ; then
  echo "$OPTDIR/docbook-xslt2 not found."
  echo "Please be patient as it is downloaded..."
  git clone git://github.com/davidpriest/docbook.github.com.git $OPTDIR/docbook-xslt2
  wait
  xunzip -f $OPTDIR/docbook-xslt2/release/2.0.0/docbook-xslt2-2.0.0.zip
fi
if [ ! -d $OPTDIR/xalan-j_2_7_1 ] ; then
  echo "$OPTDIR/xalan-j_2_7_1 not found."
  echo "Please be patient as it is downloaded..."
  http -get http://apache.sunsite.ualberta.ca//xml/xalan-j/xalan-j_2_7_1-bin.zip > $OPTDIR/xalan-j_2_7_1-bin.zip
  wait
  xunzip -f $OPTDIR/xalan-j_2_7_1-bin.zip -d $OPTDIR
fi

if [ ! -d $OPTDIR/XEP ] ; then
  echo "$OPTDIR/XEP not found."
  echo "PDF publishing will not be possible."
fi

if [ ! -e "$USRETC/config.properties" ] ; then
  echo "$USRETC/config.properties not found."
  echo "Publishing will not be possible."
fi

# dps prompt
echo ""
echo "David's Documentation Shell"
echo "Copyright (C) 2011 David Priest, davidpriest.ca"
echo "GNU General Public License"
echo ""
echo "type `dhelp` for help"
echo ""
PS1="DPS$ "

# utilities
#TODO: find all du_ files, loop
[ -e $SBINDIR/du_setopts ] && . $SBINDIR/du_setopts
[ -e $SBINDIR/du_setpub ] && . $SBINDIR/du_setpub
[ -e $SBINDIR/du_setrally ] && . $SBINDIR/du_setrally
