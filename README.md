Docbook Publishing System
=========================

A Java shell environment for publishing Docbook 5 to multiple output formats.

Pre-Requisites
--------------

All platforms require: 

  - Java

Installation
------------

On OS X and Linux, DPS attempts to be self-installing. When first run, it will
install XMLSH.

Windows users must install XMLShell after cloning DPS.

  1. Browse to [XMLSH](http://sourceforge.net/projects/xmlsh/ Download XMLSH).
  
  2. Download the package appropriate for your OS.
  
  3. Expand the package into *DPS*`\opt\xmlsh_1_1_4`

# Using DPS Standalone

In this scenario, you will clone the DPS repository directly, and install your
Docbook source in *DPS*`/home` and your XSL, custom scripts, configuration
files, and so on in *DPS*`/usr`.
To use DPS Standalone:

    git clone git@github.com:davidpriest/dps.git MyPubs
    cd MyPubs
    mkdir home/doc-source
    mkdir usr
The end-user process of cloning your documentation will be to clone your DPS
repository. The end-user will not be able to easily update the publishing
system component: by default, they will use what you pass through to them.

# Using DPS in a Superproject

In this scenario, you will create a superproject, and then install the publishing system, publication source, and publication customizations as separate sub-modules.

    mkdir MySuperProj; cd MySuperProj
    git init
    mkdir opt usr home/doc-source
    git submodule add git@github.com:davidpriest/dps.git opt/dps/
    git submodule add git@github.com:yourname/MyDocs home/doc-source/
    git submodule add git@github.com:yourname/MyDocsSupp usr/
    git submodule init
    git submodule update
The end-user process of cloning a superproject is a three-step process: Clone the repo, initialize its sub-modules, and then update the submodules:

    git clone git@github.com:davidpriest/dps.git DPS
    git submodule init
    git submodule update

Booting
-------

Windows:

  1. At a command prompt in *DPS*, type `boot` and press `enter`.
  
  2. On first boot, DPS attempts to install the open-source Docbook Schema,
  Docbook XSL, and Xalan toolsets. If a source site is unavailable, you can
  install these tools to *DPS*`\opt` manually.  See Resources, below.
  
  3. At the `dps$` prompt, type `dhelp` for help.

Posix (OS X, Linux):
  
  1. At a Bash command prompt in *DPS*, type `./boot` and press `return`.
  
  2. On first boot, DPS attempts to install the open-source Docbook Schema,
  Docbook XSL, and Xalan toolsets. If a source site is unavailable, you can
  install these tools to *DPS*`/opt` manually.  See Resources, below.

  3. At the `dps$` prompt, type `dhelp` for help.

Installing PDF Publishing
-------------------------

To publish PDFs, install RenderX XEP (or an alias to XEP) in 
*DPS*`\opt\XEP`.  A PDF fonts directory is also required; I have not
determined the best solution for installing them.  Email David.

Publishing
----------

Use the `dls` command to see a list of available publications.

Use the `review` *docname* command to publish a draft PDF edition, with purple 
numbers and comments enabled. The result will be put in `home/doc-review`.

Use `publish [pdf|web|chm]` *docname* to publish a release PDF, Webhelp, or 
CHM-source edition. The result will be put in `home/doc-release`.

Profiling is available, and detailed in the DPS User Guide.

Resources
---------

Source and destinations as indicated:

DPS:

    https://github.com/davidpriest/dps

    DPS/opt/dps

DocBook 5 Schema:

    http://www.docbook.org/xml/5.0/docbook-5.0.zip

    DPS/opt/docbook-5.0

DocBook 5 XSL:

    http://downloads.sourceforge.net/project/docbook/docbook-xsl-ns/1.76.1/docbook-xsl-ns-1.76.1.zip

    DPS/opt/docbook-xsl-ns-1.76.1

Xalan:

    http://apache.sunsite.ualberta.ca/xml/xalan-j/xalan-j_2_7_1-bin.zip

    DPS/opt/xalan-j_2_7_1-bin
