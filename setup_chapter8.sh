#!/bin/bash

# 06/01/2023 by cjung-mo 
# https://www.linuxfromscratch.org/lfs/view/stable/chapter08/chapter08.html 
# linux from scratch - version 11.2
# chapter 8. installing basic system software 

# ------- Included Packages -------- 
# package name	     build time space
# ----------------------------------
# Man-pages-5.13 	0.1 SBU	33MB
# Iana-Etc-20220812	0.1 SBU	4.8MB
# Glibc-2.36		 24 SBU	2.8GB	
# Zlib-1.2.13		0.1 SBU	6.1MB
# Bzip2-1.0.8		0.1 SBU	7.2MB	
# Xz-5.2.6		0.2 SBU	16MB
# Zstd-1.5.2		1.1 SBU	56MB
# File-5.42		0.1 SBU	16MB
# Readline-8.1.2	0.1 SBU	15MB
# M4-1.4.19		0.6 SBU	49MB
# Bc-6.0.1		0.1 SBU	7.4MB
# Flex-2.6.4		0.4 SBU	33MB
# Tcl-8.6.12		3.2 SBU	88MB
# Expect-5.45.4		0.2 SBU	3.9MB
# DejaGNU-1.6.3		0.1 SBU	6.9MB
# Binutils-2.39		8.2 SBU	2.7MB
# GMP-6.2.1		0.9 SBU	53MB
# MPFR-4.1.0		0.8 SBU	39MB
# MPC-1.2.1		0.3 SBU	21MB
# Attr-2.5.1		0.1 SBU	4.1MB
# Acl-2.3.1		0.1 SBU	6.1MB
# Libcap-2.65		0.1 SBU	2.7MB
# Shadow-4.12.2		0.2 SBU	46MB
#                   +  -------------
#  		    =  41.2 SBU	3317MB	
# ----------------------------------

set -xe
PK_MAN_PAGES='man-pages-5.13'
PK_IANA_ETC='iana-etc-20220812'
PK_GLIBC='glibc-2.36'
PK_ZLIB='zlib-1.2.13'
PK_BZIP2='bzip2-1.0.8'
PK_XZ='xz-5.2.6'
PK_ZSTD='zstd-1.5.2'
PK_FILE='file-5.42'
PK_READLINE='readline-8.1.2'
PK_M4='m4-1.4.19'
PK_BC='bc-6.0.1'
PK_FLEX='flex-2.6.4'
PK_TCL='tcl8.6.12'
PK_EXPECT='expect5.45.4'
PK_DEJAGNU='dejagnu-1.6.3'
PK_BINUTILS='binutils-2.39'
PK_GMP='gmp-6.2.1'
PK_MPFR='mpfr-4.1.0'
PK_MPC='mpc-1.2.1'
PK_ATTR='attr-2.5.1'
PK_ACL='acl-2.3.1'
PK_LIBCAP='libcap-2.65'
PK_SHADOW='shadow-4.12.2'

# cd ${LFS}/sources


# Man-pages-5.13 	0.1 SBU	33MB
tar -xf ${PK_MAN_PAGES}.tar.xz
echo "Start building  ${PK_MAN_PAGES}"
pushd ${PK_MAN_PAGES}

make prefix=/usr install

popd
rm -rf ${PK_MAN_PAGES}
# build-${PK_MAN_PAGES} ends 



# Iana-Etc-20220812	0.1 SBU	4.8MB
tar -xf ${PK_IANA_ETC}.tar.gz
echo "start building  ${PK_IANA_ETC}"
pushd ${PK_IANA_ETC}

cp services protocols /etc

popd
rm -rf ${PK_IANA_ETC}
# build-${PK_IANA_ETC} ends 


# Glibc-2.36		24 SBU	2.8GB	
tar -xf ${PK_GLIBC}.tar.xz
echo "start building  ${PK_GLIBC}"
pushd ${PK_GLIBC}

patch -Np1 -i ../glibc-2.36-fhs-1.patch

mkdir -v build
cd       build

echo "rootsbindir=/usr/sbin" > configparms

../configure --prefix=/usr                            \
             --disable-werror                         \
             --enable-kernel=3.2                      \
             --enable-stack-protector=strong          \
             --with-headers=/usr/include              \
             libc_cv_slibdir=/usr/lib

make -j12
#make check
touch /etc/ld.so.conf
sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile
make install
sed '/RTLDLIST=/s@/usr@@g' -i /usr/bin/ldd
cp -v ../nscd/nscd.conf /etc/nscd.conf
mkdir -pv /var/cache/nscd

mkdir -pv /usr/lib/locale
localedef -i POSIX -f UTF-8 C.UTF-8 2> /dev/null || true
localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
localedef -i de_DE -f ISO-8859-1 de_DE
localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
localedef -i de_DE -f UTF-8 de_DE.UTF-8
localedef -i el_GR -f ISO-8859-7 el_GR
localedef -i en_GB -f ISO-8859-1 en_GB
localedef -i en_GB -f UTF-8 en_GB.UTF-8
localedef -i en_HK -f ISO-8859-1 en_HK
localedef -i en_PH -f ISO-8859-1 en_PH
localedef -i en_US -f ISO-8859-1 en_US
localedef -i en_US -f UTF-8 en_US.UTF-8
localedef -i es_ES -f ISO-8859-15 es_ES@euro
localedef -i es_MX -f ISO-8859-1 es_MX
localedef -i fa_IR -f UTF-8 fa_IR
localedef -i fr_FR -f ISO-8859-1 fr_FR
localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
localedef -i is_IS -f ISO-8859-1 is_IS
localedef -i is_IS -f UTF-8 is_IS.UTF-8
localedef -i it_IT -f ISO-8859-1 it_IT
localedef -i it_IT -f ISO-8859-15 it_IT@euro
localedef -i it_IT -f UTF-8 it_IT.UTF-8
localedef -i ja_JP -f EUC-JP ja_JP
localedef -i ja_JP -f SHIFT_JIS ja_JP.SJIS 2> /dev/null || true
localedef -i ja_JP -f UTF-8 ja_JP.UTF-8
localedef -i nl_NL@euro -f ISO-8859-15 nl_NL@euro
localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R
localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
localedef -i se_NO -f UTF-8 se_NO.UTF-8
localedef -i ta_IN -f UTF-8 ta_IN.UTF-8
localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
localedef -i zh_CN -f GB18030 zh_CN.GB18030
localedef -i zh_HK -f BIG5-HKSCS zh_HK.BIG5-HKSCS
localedef -i zh_TW -f UTF-8 zh_TW.UTF-8

make localedata/install-locales

localedef -i POSIX -f UTF-8 C.UTF-8 2> /dev/null || true
localedef -i ja_JP -f SHIFT_JIS ja_JP.SJIS 2> /dev/null || true

cat > /etc/nsswitch.conf << "EOF"
# Begin /etc/nsswitch.conf

passwd: files
group: files
shadow: files

hosts: files dns
networks: files

protocols: files
services: files
ethers: files
rpc: files

# End /etc/nsswitch.conf
EOF

tar -xf ../../tzdata2022c.tar.gz

ZONEINFO=/usr/share/zoneinfo
mkdir -pv $ZONEINFO/{posix,right}

for tz in etcetera southamerica northamerica europe africa antarctica  \
          asia australasia backward; do
    zic -L /dev/null   -d $ZONEINFO       ${tz}
    zic -L /dev/null   -d $ZONEINFO/posix ${tz}
    zic -L leapseconds -d $ZONEINFO/right ${tz}
done

cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
zic -d $ZONEINFO -p America/New_York
unset ZONEINFO

tzselect
ln -sfv /usr/share/zoneinfo/<xxx> /etc/localtime

cat > /etc/ld.so.conf << "EOF"
# Begin /etc/ld.so.conf
/usr/local/lib
/opt/lib

EOF

cat >> /etc/ld.so.conf << "EOF"
# Add an include directory
include /etc/ld.so.conf.d/*.conf

EOF
mkdir -pv /etc/ld.so.conf.d
popd
rm -rf ${PK_GLIBC}
# build-${PK_GLIBC} ends 



# Zlib-1.2.12		0.1 SBU	6.1MB
tar -xf ${PK_ZLIB}.tar.xz
echo "Start building  ${PK_ZLIB}"
pushd ${PK_ZLIB}

./configure --prefix=/usr
make -j12
#make check
make install
rm -fv /usr/lib/libz.a

popd
rm -rf ${PK_ZLIB}
# build-${PK_ZLIB} ends 



# Bzip2-1.0.8		0.1 SBU	7.2MB	
tar -xf ${PK_BZIP2}.tar.gz
echo "Start building  ${PK_BZIP2}"
pushd ${PK_BZIP2}

patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch
sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile

make -f Makefile-libbz2_so
make clean

make -j12
make PREFIX=/usr install

cp -av libbz2.so.* /usr/lib
ln -sv libbz2.so.1.0.8 /usr/lib/libbz2.so

cp -v bzip2-shared /usr/bin/bzip2
for i in /usr/bin/{bzcat,bunzip2}; do
  ln -sfv bzip2 $i
done

rm -fv /usr/lib/libbz2.a

popd
rm -rf ${PK_BZIP2}
# build-${PK_BZIP2} ends 



# Xz-5.2.6		0.2 SBU	16MB
tar -xf ${PK_XZ}.tar.xz
echo "Start building  ${PK_XZ}"
pushd ${PK_XZ}

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.6

make -j12
#make check
make install

popd
rm -rf ${PK_XZ}
# build-${PK_XZ} ends 



# Zstd-1.5.2		1.1 SBU	56MB
tar -xf ${PK_ZSTD}.tar.gz
echo "Start building  ${PK_ZSTD}"
pushd ${PK_ZSTD}

patch -Np1 -i ../zstd-1.5.2-upstream_fixes-1.patch
make prefix=/usr
#make check
make prefix=/usr install
rm -v /usr/lib/libzstd.a

popd
rm -rf ${PK_ZSTD}
# build-${PK_ZSTD} ends 



# File-5.42		0.1 SBU	16MB
tar -xf ${PK_FILE}.tar.gz
echo "Start building  ${PK_FILE}"
pushd ${PK_FILE}

./configure --prefix=/usr
make -j12
#make check
make install

popd
rm -rf ${PK_FILE}
# build-${PK_FILE} ends 



# Readline-8.1.2	0.1 SBU	15MB
tar -xf ${PK_READLINE}.tar.gz
echo "Start building  ${PK_READLINE}"
pushd ${PK_READLINE}

sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.1.2

make SHLIB_LIBS="-lncursesw"
make SHLIB_LIBS="-lncursesw" install
install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.1.2

popd
rm -rf ${PK_READLINE}
# build-${PK_READLINE} ends 



# M4-1.4.19		0.6 SBU	49MB
tar -xf ${PK_M4}.tar.xz
echo "Start building  ${PK_M4}"
pushd ${PK_M4}

./configure --prefix=/usr
make -j12
#make check
make install

popd
rm -rf ${PK_M4}
# build-${PK_M4} ends 



# Bc-6.0.1		0.1 SBU	7.4MB
tar -xf ${PK_BC}.tar.xz
echo "Start building  ${PK_BC}"
pushd ${PK_BC}

CC=gcc ./configure --prefix=/usr -G -O3 -r
make -j12
#make test
make install

popd
rm -rf ${PK_BC}
# build-${PK_BC} ends 



# Flex-2.6.4		0.4 SBU	33MB
tar -xf ${PK_FLEX}.tar.gz
echo "Start building  ${PK_FLEX}"
pushd ${PK_FLEX}

./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static

make -j12
#make check
make install
ln -sv flex /usr/bin/lex

popd
rm -rf ${PK_FLEX}
# build-${PK_FLEX} ends 



# Tcl-8.6.12		3.2 SBU	88MB
tar -xf ${PK_TCL}-src.tar.gz
echo "Start building  ${PK_TCL}"
pushd ${PK_TCL}

tar -xf ../tcl8.6.12-html.tar.gz --strip-components=1
SRCDIR=$(pwd)
cd unix
./configure --prefix=/usr           \
            --mandir=/usr/share/man

make -j12

sed -e "s|$SRCDIR/unix|/usr/lib|" \
    -e "s|$SRCDIR|/usr/include|"  \
    -i tclConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.3|/usr/lib/tdbc1.1.3|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.3/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/tdbc1.1.3/library|/usr/lib/tcl8.6|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.3|/usr/include|"            \
    -i pkgs/tdbc1.1.3/tdbcConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.2|/usr/lib/itcl4.2.2|" \
    -e "s|$SRCDIR/pkgs/itcl4.2.2/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/itcl4.2.2|/usr/include|"            \
    -i pkgs/itcl4.2.2/itclConfig.sh

unset SRCDIR

#make test
make install
chmod -v u+w /usr/lib/libtcl8.6.so
make install-private-headers
ln -sfv tclsh8.6 /usr/bin/tclsh
mv /usr/share/man/man3/{Thread,Tcl_Thread}.3

mkdir -v -p /usr/share/doc/tcl-8.6.12
cp -v -r  ../html/* /usr/share/doc/tcl-8.6.12

popd
rm -rf ${PK_TCL}
# build-${PK_TCL} ends 



# Expect-5.45.4		0.2 SBU	3.9MB
tar -xf ${PK_EXPECT}.tar.gz
echo "Start building  ${PK_EXPECT}"
pushd ${PK_EXPECT}

./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include

make -j12
#make test
make install
ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib

popd
rm -rf ${PK_EXPECT}
# build-${PK_EXPECT} ends 



# DejaGNU-1.6.3		0.1 SBU	6.9MB
tar -xf ${PK_DEJAGNU}.tar.gz
echo "Start building  ${PK_DEJAGNU}"
pushd ${PK_DEJAGNU}

mkdir -v build
cd       build

../configure --prefix=/usr
makeinfo --html --no-split -o doc/dejagnu.html ../doc/dejagnu.texi
makeinfo --plaintext       -o doc/dejagnu.txt  ../doc/dejagnu.texi

make install
install -v -dm755  /usr/share/doc/dejagnu-1.6.3
install -v -m644   doc/dejagnu.{html,txt} /usr/share/doc/dejagnu-1.6.3

#make check

popd
rm -rf ${PK_DEJAGNU}
# build-${PK_DEJAGNU} ends 



# Binutils-2.39		8.2 SBU	2.7MB
tar -xf ${PK_BINUTILS}.tar.xz
echo "Start building  ${PK_BINUTILS}"
pushd ${PK_BINUTILS}

expect -c "spawn ls"
spawn ls

mkdir -v build
cd       build

../configure --prefix=/usr       \
             --sysconfdir=/etc   \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib

make tooldir=/usr
#make -k check
make tooldir=/usr install
rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.a

popd
rm -rf ${PK_BINUTILS}
# build-${PK_BINUTILS} ends 



# GMP-6.2.1		0.9 SBU	53MB
tar -xf ${PK_GMP}.tar.xz
echo "Start building  ${PK_GMP}"
pushd ${PK_GMP}

./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.2.1

make -j12
make html
make check 2>&1 | tee gmp-check-log
awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log

make install
make install-html

popd
rm -rf ${PK_GMP}
# build-${PK_GMP} ends 



# MPFR-4.1.0		0.8 SBU	39MB
tar -xf ${PK_MPFR}.tar.xz
echo "Start building  ${PK_MPFR}"
pushd ${PK_MPFR}

./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.1.0
	
make -j12
make html
make check

make install
make install-html

popd
rm -rf ${PK_MPFR}
# build-${PK_MPFR} ends 



# MPC-1.2.1		0.3 SBU	21MB
tar -xf ${PK_MPC}.tar.gz
echo "Start building  ${PK_MPC}"
pushd ${PK_MPC}

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.2.1

make -j12
make html
#make check

make install
make install-html

popd
rm -rf ${PK_MPC}
# build-${PK_MPC} ends 



# Attr-2.5.1		0.1 SBU	4.1MB
tar -xf ${PK_ATTR}.tar.gz
echo "Start building  ${PK_ATTR}"
pushd ${PK_ATTR}

./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.5.1

make -j12
#make check
make install

popd
rm -rf ${PK_ATTR}
# build-${PK_ATTR} ends 



# Acl-2.3.1		0.1 SBU	6.1MB
tar -xf ${PK_ACL}.tar.xz
echo "Start building  ${PK_ACL}"
pushd ${PK_ACL}

./configure --prefix=/usr         \
            --disable-static      \
            --docdir=/usr/share/doc/acl-2.3.1

make -j12
make install

popd
rm -rf ${PK_ACL}
# build-${PK_ACL} ends 



# Libcap-2.65		0.1 SBU	2.7MB
tar -xf ${PK_LIBCAP}.tar.xz
echo "Start building  ${PK_LIBCAP}"
pushd ${PK_LIBCAP}

sed -i '/install -m.*STA/d' libcap/Makefile

make prefix=/usr lib=lib
#make test
make prefix=/usr lib=lib install

popd
rm -rf ${PK_LIBCAP}
# build-${PK_LIBCAP} ends 



# Shadow-4.12.2		0.2 SBU	46MB
tar -xf ${PK_SHADOW}.tar.xz
echo "Start building  ${PK_SHADOW}"
pushd ${PK_SHADOW}

sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;

sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD SHA512:' \
    -e 's:/var/spool/mail:/var/mail:'                 \
    -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                \
    -i etc/login.defs

sed -i 's:DICTPATH.*:DICTPATH\t/lib/cracklib/pw_dict:' etc/login.defs

touch /usr/bin/passwd
./configure --sysconfdir=/etc \
            --disable-static  \
            --with-group-name-max-length=32

make -j12
make exec_prefix=/usr install
make -C man install-man

pwconv
grpconv
mkdir -p /etc/default
useradd -D --gid 999
sed -i '/MAIL/s/yes/no/' /etc/default/useradd
passwd root

popd
rm -rf ${PK_SHADOW}
# build-${PK_SHADOW} ends 
