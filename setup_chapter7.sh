#!/bin/bash

# 06/01/2023 by cjung-mo 
# https://www.linuxfromscratch.org/lfs/view/stable/chapter07/introduction.html
# linux from scratch - version 11.2
# chapter 7. entering chroot and building additional temporary tools

# ------- Included Packages -------- 
# package name	     build time space
# ----------------------------------
# Gettext-0.21		1.6 SBU	282MB
# Bison-3.8.2		0.3 SBU	57MB
# Perl-5.36.0		1.6 SBU	282MB	
# Python-3.10.6		0.9 SBU	364MB
# Texinfo-6.8		0.2 SBU	113MB
# Util-linux-2.38.1	0.6 SBU 149MB
#                   +  -------------
#  		    =	5.2 SBU	1247MB	
# ----------------------------------

set -xe
# PK_GETTEXT='gettext-0.21'
# PK_BISON='bison-3.8.2'
# PK_PERL='perl-5.36.0'
# PK_PYTHON='python-3.10.6'
# PK_TEXINFO='texinfo-6.8'
# PK_UTIL_LINUX='util-linux-2.38.1'

cd ${LFS}/sources


# Gettext-0.21		1.6 SBU	282MB
tar -xf gettext-0.21.tar.xz
echo 'start building  gettext-0.21'
pushd 'gettext-0.21'

./configure --disable-shared
	
make -j4
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

popd
rm -rf 'gettext-0.21'
# build-gettext-0.21 ends 



# Bison-3.8.2		0.3 SBU	57MB
tar -xf bison-3.8.2.tar.xz
echo 'start building  bison-3.8.2'
pushd 'bison-3.8.2'

./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.8.2
make -j4
make install

popd
rm -rf 'bison-3.8.2'
# build-bison-3.8.2 ends 



# Perl-5.36.0		1.6 SBU	282MB	
tar -xf perl-5.36.0.tar.xz
echo 'start building  perl-5.36.0'
pushd 'perl-5.36.0'

sh Configure -des                                        \
             -Dprefix=/usr                               \
             -Dvendorprefix=/usr                         \
             -Dprivlib=/usr/lib/perl5/5.36/core_perl     \
             -Darchlib=/usr/lib/perl5/5.36/core_perl     \
             -Dsitelib=/usr/lib/perl5/5.36/site_perl     \
             -Dsitearch=/usr/lib/perl5/5.36/site_perl    \
             -Dvendorlib=/usr/lib/perl5/5.36/vendor_perl \
             -Dvendorarch=/usr/lib/perl5/5.36/vendor_perl

make -j4
make install

popd
rm -rf 'perl-5.36.0'
# build-perl-5.36.0 ends 



# Python-3.10.6		0.9 SBU	364MB
tar -xf Python-3.10.6.tar.xz
echo 'start building  Python-3.10.6'
pushd 'Python-3.10.6'

./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip

make -j4
make install

popd
rm -rf 'Python-3.10.6'
# build-Python-3.10.6 ends 



# Texinfo-6.8		0.2 SBU	113MB
tar -xf texinfo-6.8.tar.xz
echo 'start building  texinfo-6.8'
pushd 'texinfo-6.8'

./configure --prefix=/usr
make -j4
make install

popd
rm -rf 'texinfo-6.8'
# build-texinfo-6.8 ends 



# Util-linux-2.38.1	0.6 SBU 149MB
tar -xf util-linux-2.38.1.tar.xz
echo 'start building  util-linux-2.38.1'
pushd 'util-linux-2.38.1'

mkdir -pv /var/lib/hwclock

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime    \
            --libdir=/usr/lib    \
            --docdir=/usr/share/doc/util-linux-2.38.1 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            runstatedir=/run

make -j4
make install

popd
rm -rf 'util-linux-2.38.1'
# build-util-linux-2.38.1 ends 
