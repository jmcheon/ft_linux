#!/bin/bash

# 06/01/2023 by cjung-mo 
# https://www.linuxfromscratch.org/lfs/view/stable/chapter08/chapter08.html 
# linux from scratch - version 11.2
# chapter 8. installing basic system software 

# ------- Included Packages -------- 
# package name	     build time space
# ----------------------------------
# GCC-12.2.0		160 SBU	(with tests) 5.1MB
# Pkg-config-0.29.2	0.3 SBU	29MB
# Ncurses-6.3		0.4 SBU	45MB
# Sed-4.8		0.4 SBU	31MB
# Psmisc-23.5		0.1 SBU	5.8MB
# Gettext-0.21		2.7 SBU	235MB
# Bison-3.8.2		8.7 SBU	63MB
# Grep-3.7		0.8 SBU	37MB
# Bash-5.1.16		1.4 SBU	50MB
# Libtool-2.4.7		1.5 SBU	43MB
# GDBM-1.23		0.1 SBU	13MB
# Gperf-3.1		0.1 SBU	6MB
# Expat-2.5.0		0.1 SBU	12MB
# Inetutils-2.3		0.3 SBU	31MB
# Less-590		0.1 SBU	4.2MB
# Perl-5.36.0		9.4 SBU	236MB
# XML-Parser-2.46	0.1 SBU	2.3MB
# Intltool-0.51.0	0.1 SBU	1.5MB
# Autoconf-2.71		0.1 SBU	24MB
# Automake-1.16.5	0.1 SBU	116MB
# OpenSSL-3.0.5		5.0 SBU	476MB
# Kmod-30		0.1 SBU	12MB
# Elfutils-0.187	0.9 SBU	117MB
# Libffi-3.4.2		1.8 SBU	10MB
# Python-3.10.6		3.4 SBU	283MB
# Wheel-0.37.1		0.1 SBU	956KB
# Ninja-1.11.0		0.6 SBU	79MB
# Meson-0.63.1		0.1 SBU	38MB
# Coreutils-9.1		2.8 SBU	159MB
# Check-0.15.2		0.1 SBU	12MB
# Diffutils-3.8		0.6 SBU	35MB
# Gawk-5.1.1		0.4 SBU	44MB
# Findutils-4.9.0	0.8 SBU	52MB
# Groff-1.22.4		0.5 SBU	88MB
# GRUB-2.06		0.7 SBU	159MB
# Gzip-1.12		0.3 SBU	21MB
# IPRoute2-5.19.0	0.2 SBU	16MB
# Kbd-2.5.1		0.1 SBU	35MB
# Libpipeline-1.5.6	0.1 SBU	10MB
# Make-4.3		0.5 SBU	14MB
# Patch-2.7.6		0.2 SBU	12MB
# Tar-1.34		1.7 SBU	40MB
# Texinfo-6.8		0.6 SBU	114MB
# Vim-9.0.0228		2.5 SBU	217MB
# Eudev-3.2.11		0.2 SBU	83MB
# Man-DB-2.10.2		0.4 SBU	40MB
# Procps-ng-4.0.0	0.1 SBU	19MB
# Util-linux-2.38.1	1.0 SBU	283MB
# E2fsprogs-1.46.5	1.2 SBU	94MB
# Sysklogd-1.5.1	0.1 SBU	0.6MB
# Sysvinit-3.04		0.1 SBU	2.7MB
#                   +  -------------
#  except for GCC   =  53.9 SBU	3.5GB	
# ----------------------------------

set -xe
PK_GCC='gcc-12.2.0'
PK_PKG_CONFIG='pkg-config-0.29.2'
PK_NCURSES='ncurses-6.3'
PK_SED='sed-4.8'
PK_PSMISC='psmisc-23.5'
PK_GETTEXT='gettext-0.21'
PK_BISON='bison-3.8.2'
PK_GREP='grep-3.7'
PK_BASH='bash-5.1.16'
PK_LIBTOOL='libtool-2.4.7'
PK_GDBM='gdbm-1.23'
PK_GPERF='gperf-3.1'
PK_EXPAT='expat-2.5.0'
PK_INETUTILS='inetutils-2.3'
PK_LESS='less-590'
PK_PERL='perl-5.36.0'
PK_XML_PARSER='XML-Parser-2.46'
PK_INTLTOOL='intltool-0.51.0'
PK_AUTOCONF='autoconf-2.71'
PK_AUTOMAKE='automake-1.16.5'
PK_OPENSSL='openssl-3.0.5'
PK_KMOD='kmod-30'
PK_ELFUTILS='elfutils-0.187'
PK_LIBFFI='libffi-3.4.2'
PK_PYTHON='Python-3.10.6'
PK_WHEEL='wheel-0.37.1'
PK_NINJA='ninja-1.11.0'
PK_MESON='meson-0.63.1'
PK_COREUTILS='coreutils-9.1'
PK_CHECK='check-0.15.2'
PK_DIFFUTILS='diffutils-3.8'
PK_GAWK='gawk-5.1.1'
PK_FINDUTILS='findutils-4.9.0'
PK_GROFF='groff-1.22.4'
PK_GRUB='grub-2.06'
PK_GZIP='gzip-1.12'
PK_IPROUTE='iproute2-5.19.0'
PK_KBD='kbd-2.5.1'
PK_LIBPIPELINE='libpipeline-1.5.6'
PK_MAKE='make-4.3'
PK_PATCH='patch-2.7.6'
PK_TAR='tar-1.34'
PK_TEXINFO='texinfo-6.8'
PK_VIM='vim-9.0.0228'
PK_EUDEV='eudev-3.2.11'
PK_MAN_DB='man-db-2.10.2'
PK_PROCPS_NG='procps-ng-4.0.0'
PK_UTIL_LINUX='util-linux-2.38.1'
PK_E2FSPROGS='e2fsprogs-1.46.5'
PK_SYSKLOGD='sysklogd-1.5.1'
PK_SYSVINIT='sysvinit-3.04'

# cd ${LFS}/sources


# GCC-12.2.0		160 SBU	(with tests) 5.1MB
tar -xf ${PK_GCC}.tar.xz
echo "Start building  ${PK_GCC}"
pushd ${PK_GCC}

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

mkdir -v build
cd       build

../configure --prefix=/usr            \
             LD=ld                    \
             --enable-languages=c,c++ \
             --disable-multilib       \
             --disable-bootstrap      \
             --with-system-zlib

make -j4
#ulimit -s 32768
#chown -Rv tester .
#su tester -c "PATH=$PATH make -k check"
#../contrib/test_summary

make install
chown -v -R root:root \
    /usr/lib/gcc/$(gcc -dumpmachine)/12.2.0/include{,-fixed}
ln -svr /usr/bin/cpp /usr/lib
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/12.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/

echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'

grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log
grep -B4 '^ /usr/include' dummy.log
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
grep "/lib.*/libc.so.6 " dummy.log
grep found dummy.log

rm -v dummy.c a.out dummy.log
mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

popd
rm -rf ${PK_GCC}
# build-${PK_GCC} ends 



# Pkg-config-0.29.2	0.3 SBU	29MB
tar -xf ${PK_PKG_CONFIG}.tar.gz
echo "Start building  ${PK_PKG_CONFIG}"
pushd ${PK_PKG_CONFIG}

./configure --prefix=/usr              \
            --with-internal-glib       \
            --disable-host-tool        \
            --docdir=/usr/share/doc/pkg-config-0.29.2

make -j4
#make check
make install

popd
rm -rf ${PK_PKG_CONFIG}
# build-${PK_PKG_CONFIG} ends 



# Ncurses-6.3		0.4 SBU	45MB
tar -xf ${PK_NCURSES}.tar.gz
echo "Start building  ${PK_NCURSES}"
pushd ${PK_NCURSES}

./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --with-cxx-shared       \
            --enable-pc-files       \
            --enable-widec          \
            --with-pkg-config-libdir=/usr/lib/pkgconfig

make -j4
make DESTDIR=$PWD/dest install
install -vm755 dest/usr/lib/libncursesw.so.6.3 /usr/lib
rm -v  dest/usr/lib/libncursesw.so.6.3
cp -av dest/* /
for lib in ncurses form panel menu ; do
    rm -vf                    /usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
done
rm -vf                     /usr/lib/libcursesw.so
echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so
ln -sfv libncurses.so      /usr/lib/libcurses.so

mkdir -pv      /usr/share/doc/ncurses-6.3
cp -v -R doc/* /usr/share/doc/ncurses-6.3

popd
rm -rf ${PK_NCURSES}
# build-${PK_NCURSES} ends 



# Sed-4.8		0.4 SBU	31MB
tar -xf ${PK_SED}.tar.xz
echo "Start building  ${PK_SED}"
pushd ${PK_SED}

./configure --prefix=/usr

make -j4
make html

#chown -Rv tester .
#su tester -c "PATH=$PATH make check"

make install
install -d -m755           /usr/share/doc/sed-4.8
install -m644 doc/sed.html /usr/share/doc/sed-4.8

popd
rm -rf ${PK_SED}
# build-${PK_SED} ends 



# Psmisc-23.5		0.1 SBU	5.8MB
tar -xf ${PK_PSMISC}.tar.xz
echo "Start building  ${PK_PSMISC}"
pushd ${PK_PSMISC}

./configure --prefix=/usr
make -j4
make install

popd
rm -rf ${PK_PSMISC}
# build-${PK_PSMISC} ends 



# Gettext-0.21		2.7 SBU	235MB
tar -xf ${PK_GETTEXT}.tar.xz
echo "Start building  ${PK_GETTEXT}"
pushd ${PK_GETTEXT}

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.21

make -j4
#make check
make install
chmod -v 0755 /usr/lib/preloadable_libintl.so

popd
rm -rf ${PK_GETTEXT}
# build-${PK_GETTEXT} ends 



# Bison-3.8.2		8.7 SBU	63MB
tar -xf ${PK_BISON}.tar.xz
echo "Start building  ${PK_BISON}"
pushd ${PK_BISON}

./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2
make -j4
#make check
make install

popd
rm -rf ${PK_BISON}
# build-${PK_BISON} ends 



# Grep-3.7		0.8 SBU	37MB
tar -xf ${PK_GREP}.tar.xz
echo "Start building  ${PK_GREP}"
pushd ${PK_GREP}

./configure --prefix=/usr
make -j4
#make check
make install

popd
rm -rf ${PK_GREP}
# build-${PK_GREP} ends 



# Bash-5.1.16		1.4 SBU	50MB
tar -xf ${PK_BASH}.tar.gz
echo "Start building  ${PK_BASH}"
pushd ${PK_BASH}

./configure --prefix=/usr                      \
            --docdir=/usr/share/doc/bash-5.1.16 \
            --without-bash-malloc              \
            --with-installed-readline

make -j4
#chown -Rv tester .
#su -s /usr/bin/expect tester << EOF
#set timeout -1
#spawn make tests
#expect eof
#lassign [wait] _ _ _ value
#exit $value
#EOF
make install
#exec /usr/bin/bash --login

popd
rm -rf ${PK_BASH}
# build-${PK_BASH} ends 



# Libtool-2.4.7		1.5 SBU	43MB
tar -xf ${PK_LIBTOOL}.tar.xz
echo "Start building  ${PK_LIBTOOL}"
pushd ${PK_LIBTOOL}

./configure --prefix=/usr
make -j4
#make check
make install
rm -fv /usr/lib/libltdl.a

popd
rm -rf ${PK_LIBTOOL}
# build-${PK_LIBTOOL} ends 



# GDBM-1.23		0.1 SBU	13MB
tar -xf ${PK_GDBM}.tar.gz
echo "Start building  ${PK_GDBM}"
pushd ${PK_GDBM}

./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat

make -j4
#make check
make install

popd
rm -rf ${PK_GDBM}
# build-${PK_GDBM} ends 



# Gperf-3.1		0.1 SBU	6MB
tar -xf ${PK_GPERF}.tar.gz
echo "Start building  ${PK_GPERF}"
pushd ${PK_GPERF}

./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1
make -j4
#make -j1 check
make install

popd
rm -rf ${PK_GPERF}
# build-${PK_GPERF} ends 



# Expat-2.5.0		0.1 SBU	12MB
tar -xf ${PK_EXPAT}.tar.xz
echo "Start building  ${PK_EXPAT}"
pushd ${PK_EXPAT}

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.5.0

make -j4
#make check
make install
install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.5.0

popd
rm -rf ${PK_EXPAT}
# build-${PK_EXPAT} ends 



# Inetutils-2.3		0.3 SBU	31MB
tar -xf ${PK_INETUTILS}.tar.xz
echo "Start building  ${PK_INETUTILS}"
pushd ${PK_INETUTILS}

./configure --prefix=/usr        \
            --bindir=/usr/bin    \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers

make -j4
#make check
make install
mv -v /usr/{,s}bin/ifconfig

popd
rm -rf ${PK_INETUTILS}
# build-${PK_INETUTILS} ends 



# Less-590		0.1 SBU	4.2MB
tar -xf ${PK_LESS}.tar.gz
echo "Start building  ${PK_LESS}"
pushd ${PK_LESS}

./configure --prefix=/usr --sysconfdir=/etc
make -j4
make install

popd
rm -rf ${PK_LESS}
# build-${PK_LESS} ends 



# Perl-5.36.0		9.4 SBU	236MB
tar -xf ${PK_PERL}.tar.xz
echo "Start building  ${PK_PERL}"
pushd ${PK_PERL}

export BUILD_ZLIB=False
export BUILD_BZIP2=0

sh Configure -des                                         \
             -Dprefix=/usr                                \
             -Dvendorprefix=/usr                          \
             -Dprivlib=/usr/lib/perl5/5.36/core_perl      \
             -Darchlib=/usr/lib/perl5/5.36/core_perl      \
             -Dsitelib=/usr/lib/perl5/5.36/site_perl      \
             -Dsitearch=/usr/lib/perl5/5.36/site_perl     \
             -Dvendorlib=/usr/lib/perl5/5.36/vendor_perl  \
             -Dvendorarch=/usr/lib/perl5/5.36/vendor_perl \
             -Dman1dir=/usr/share/man/man1                \
             -Dman3dir=/usr/share/man/man3                \
             -Dpager="/usr/bin/less -isR"                 \
             -Duseshrplib                                 \
             -Dusethreads

make -j4
#make test
make install
unset BUILD_ZLIB BUILD_BZIP2

popd
rm -rf ${PK_PERL}
# build-${PK_PERL} ends 



# XML-Parser-2.46	0.1 SBU	2.3MB
tar -xf ${PK_XML_PARSER}.tar.gz
echo "Start building  ${PK_XML_PARSER}"
pushd ${PK_XML_PARSER}

perl Makefile.PL
make -j4
#make test
make install

popd
rm -rf ${PK_XML_PARSER}
# build-${PK_XML_PARSER} ends 



# Intltool-0.51.0	0.1 SBU	1.5MB
tar -xf ${PK_INTLTOOL}.tar.gz
echo "Start building  ${PK_INTLTOOL}"
pushd ${PK_INTLTOOL}

sed -i 's:\\\${:\\\$\\{:' intltool-update.in
./configure --prefix=/usr
make -j4
#make check
make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO

popd
rm -rf ${PK_INTLTOOL}
# build-${PK_INTLTOOL} ends 



# Autoconf-2.71		0.1 SBU	24MB
tar -xf ${PK_AUTOCONF}.tar.xz
echo "Start building  ${PK_AUTOCONF}"
pushd ${PK_AUTOCONF}

./configure --prefix=/usr
make -j4
#make check
make install

popd
rm -rf ${PK_AUTOCONF}
# build-${PK_AUTOCONF} ends 



# Automake-1.16.5	0.1 SBU	116MB
tar -xf ${PK_AUTOMAKE}.tar.xz
echo "Start building  ${PK_AUTOMAKE}"
pushd ${PK_AUTOMAKE}

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.5
make -j4
#make -j4 check
make install

popd
rm -rf ${PK_AUTOMAKE}
# build-${PK_AUTOMAKE} ends 



# OpenSSL-3.0.5		5.0 SBU	476MB
tar -xf ${PK_OPENSSL}.tar.gz
echo "Start building  ${PK_OPENSSL}"
pushd ${PK_OPENSSL}

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

make -j4
#make test
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install
mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.0.5
cp -vfr doc/* /usr/share/doc/openssl-3.0.5

popd
rm -rf ${PK_OPENSSL}
# build-${PK_OPENSSL} ends 



# Kmod-30		0.1 SBU	12MB
tar -xf ${PK_KMOD}.tar.xz
echo "Start building  ${PK_KMOD}"
pushd ${PK_KMOD}

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --with-openssl         \
            --with-xz              \
            --with-zstd            \
            --with-zlib

make -j4
make install

for target in depmod insmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /usr/sbin/$target
done

ln -sfv kmod /usr/bin/lsmod

popd
rm -rf ${PK_KMOD}
# build-${PK_KMOD} ends 



# Elfutils-0.187	0.9 SBU	117MB
tar -xf ${PK_ELFUTILS}.tar.bz2
echo "Start building  ${PK_ELFUTILS}"
pushd ${PK_ELFUTILS}

./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy

make -j4
#make check
make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /usr/lib/libelf.a

popd
rm -rf ${PK_ELFUTILS}
# build-${PK_ELFUTILS} ends 



# Libffi-3.4.2		1.8 SBU	10MB
tar -xf ${PK_LIBFFI}.tar.gz
echo "Start building  ${PK_LIBFFI}"
pushd ${PK_LIBFFI}

./configure --prefix=/usr          \
            --disable-static       \
            --with-gcc-arch=native \
            --disable-exec-static-tramp

make -j4
#make check
make install

popd
rm -rf ${PK_LIBFFI}
# build-${PK_LIBFFI} ends 



# Python-3.10.6		3.4 SBU	283MB
tar -xf ${PK_PYTHON}.tar.xz
echo "Start building  ${PK_PYTHON}"
pushd ${PK_PYTHON}

./configure --prefix=/usr        \
            --enable-shared      \
            --with-system-expat  \
            --with-system-ffi    \
            --enable-optimizations

make -j4
make install

cat > /etc/pip.conf << EOF
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF

install -v -dm755 /usr/share/doc/python-3.10.6/html

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.10.6/html \
    -xvf ../python-3.10.6-docs-html.tar.bz2

popd
rm -rf ${PK_PYTHON}
# build-${PK_PYTHON} ends 



# Wheel-0.37.1		0.1 SBU	956KB
tar -xf ${PK_WHEEL}.tar.gz
echo "Start building  ${PK_WHEEL}"
pushd ${PK_WHEEL}

pip3 install --no-index $PWD

popd
rm -rf ${PK_WHEEL}
# build-${PK_WHEEL} ends 



# Ninja-1.11.0		0.6 SBU	79MB
tar -xf ${PK_NINJA}.tar.gz
echo "Start building  ${PK_NINJA}"
pushd ${PK_NINJA}

export NINJAJOBS=4

sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc

python3 configure.py --bootstrap

./ninja ninja_test
./ninja_test --gtest_filter=-SubprocessTest.SetWithLots

install -vm755 ninja /usr/bin/
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja

popd
rm -rf ${PK_NINJA}
# build-${PK_NINJA} ends 



# Meson-0.63.1		0.1 SBU	38MB
tar -xf ${PK_MESON}.tar.gz
echo "Start building  ${PK_MESON}"
pushd ${PK_MESON}

pip3 wheel -w dist --no-build-isolation --no-deps $PWD

pip3 install --no-index --find-links dist meson
install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson
install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson

popd
rm -rf ${PK_MESON}
# build-${PK_MESON} ends 



# Coreutils-9.1		2.8 SBU	159MB
tar -xf ${PK_COREUTILS}.tar.xz
echo "Start building  ${PK_COREUTILS}"
pushd ${PK_COREUTILS}

patch -Np1 -i ../coreutils-9.1-i18n-1.patch

autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

make -j4
make NON_ROOT_USERNAME=tester check-root
#echo "dummy:x:102:tester" >> /etc/group
#chown -Rv tester . 
#su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"
#sed -i '/dummy/d' /etc/group
make install

mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8

popd
rm -rf ${PK_COREUTILS}
# build-${PK_COREUTILS} ends 



# Check-0.15.2		0.1 SBU	12MB
tar -xf ${PK_CHECK}.tar.gz
echo "Start building  ${PK_CHECK}"
pushd ${PK_CHECK}

./configure --prefix=/usr --disable-static
make -j4
#make check
make docdir=/usr/share/doc/check-0.15.2 install

popd
rm -rf ${PK_CHECK}
# build-${PK_CHECK} ends 



# Diffutils-3.8		0.6 SBU	35MB
tar -xf ${PK_DIFFUTILS}.tar.xz
echo "Start building  ${PK_DIFFUTILS}"
pushd ${PK_DIFFUTILS}

./configure --prefix=/usr
make -j4
#make check
make install

popd
rm -rf ${PK_DIFFUTILS}
# build-${PK_DIFFUTILS} ends 



# Gawk-5.1.1		0.4 SBU	44MB
tar -xf ${PK_GAWK}.tar.xz
echo "Start building  ${PK_GAWK}"
pushd ${PK_GAWK}

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr

make -j4
#make check
make install

mkdir -pv                                   /usr/share/doc/gawk-5.1.1
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.1.1

popd
rm -rf ${PK_GAWK}
# build-${PK_GAWK} ends 



# Findutils-4.9.0	0.8 SBU	52MB
tar -xf ${PK_FINDUTILS}.tar.xz
echo "Start building  ${PK_FINDUTILS}"
pushd ${PK_FINDUTILS}

case $(uname -m) in
    i?86)   TIME_T_32_BIT_OK=yes ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
    x86_64) ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
esac

make -j4
#chown -Rv tester .
#su tester -c "PATH=$PATH make check"
make install

popd
rm -rf ${PK_FINDUTILS}
# build-${PK_FINDUTILS} ends 



# Groff-1.22.4		0.5 SBU	88MB
tar -xf ${PK_GROFF}.tar.gz
echo "Start building  ${PK_GROFF}"
pushd ${PK_GROFF}

PAGE=A4 ./configure --prefix=/usr

make -j1
make install

popd
rm -rf ${PK_GROFF}
# build-${PK_GROFF} ends 



# GRUB-2.06		0.7 SBU	159MB
tar -xf ${PK_GRUB}.tar.xz
echo "Start building  ${PK_GRUB}"
pushd ${PK_GRUB}

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

make -j4
make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions

popd
rm -rf ${PK_GRUB}
# build-${PK_GRUB} ends 



# Gzip-1.12		0.3 SBU	21MB
tar -xf ${PK_GZIP}.tar.xz
echo "Start building  ${PK_GZIP}"
pushd ${PK_GZIP}

./configure --prefix=/usr
make -j4
#make check
make install

popd
rm -rf ${PK_GZIP}
# build-${PK_GZIP} ends 



# IPRoute2-5.19.0	0.2 SBU	16MB
tar -xf ${PK_IPROUTE}.tar.xz
echo "Start building  ${PK_IPROUTE}"
pushd ${PK_IPROUTE}

sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8

make NETNS_RUN_DIR=/run/netns

make SBINDIR=/usr/sbin install

mkdir -pv             /usr/share/doc/iproute2-5.19.0
cp -v COPYING README* /usr/share/doc/iproute2-5.19.0

popd
rm -rf ${PK_IPROUTE}
# build-${PK_IPROUTE} ends 



# Kbd-2.5.1		0.1 SBU	35MB
tar -xf ${PK_KBD}.tar.xz
echo "Start building  ${PK_KBD}"
pushd ${PK_KBD}

patch -Np1 -i ../kbd-2.5.1-backspace-1.patch

sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in

./configure --prefix=/usr --disable-vlock
make -j4
#make check
make install

mkdir -pv           /usr/share/doc/kbd-2.5.1
cp -R -v docs/doc/* /usr/share/doc/kbd-2.5.1

popd
rm -rf ${PK_KBD}
# build-${PK_KBD} ends 



# Libpipeline-1.5.6	0.1 SBU	10MB
tar -xf ${PK_LIBPIPELINE}.tar.gz
echo "Start building  ${PK_LIBPIPELINE}"
pushd ${PK_LIBPIPELINE}

./configure --prefix=/usr
make -j4
#make check
make install

popd
rm -rf ${PK_LIBPIPELINE}
# build-${PK_LIBPIPELINE} ends 



# Make-4.3		0.5 SBU	14MB
tar -xf ${PK_MAKE}.tar.gz
echo "Start building  ${PK_MAKE}"
pushd ${PK_MAKE}

./configure --prefix=/usr
make -j4
#make check
make install

popd
rm -rf ${PK_MAKE}
# build-${PK_MAKE} ends 



# Patch-2.7.6		0.2 SBU	12MB
tar -xf ${PK_PATCH}.tar.xz
echo "Start building  ${PK_PATCH}"
pushd ${PK_PATCH}

./configure --prefix=/usr
make -j4
#make check
make install

popd
rm -rf ${PK_PATCH}
# build-${PK_PATCH} ends 



# Tar-1.34		1.7 SBU	40MB
tar -xf ${PK_TAR}.tar.xz
echo "Start building  ${PK_TAR}"
pushd ${PK_TAR}

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr

make -j4
#make check
make install
make -C doc install-html docdir=/usr/share/doc/tar-1.34

popd
rm -rf ${PK_TAR}
# build-${PK_TAR} ends 



# Texinfo-6.8		0.6 SBU	114MB
tar -xf ${PK_TEXINFO}.tar.xz
echo "Start building  ${PK_TEXINFO}"
pushd ${PK_TEXINFO}

./configure --prefix=/usr
make -j4
#make check
make install

make TEXMF=/usr/share/texmf install-tex
pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2>/dev/null
  done
popd

popd
rm -rf ${PK_TEXINFO}
# build-${PK_TEXINFO} ends 



# Vim-9.0.0228		2.5 SBU	217MB
tar -xf ${PK_VIM}.tar.gz
echo "Start building  ${PK_VIM}"
pushd ${PK_VIM}

echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

./configure --prefix=/usr

make -j4
make install
#chown -Rv tester .
#su tester -c "LANG=en_US.UTF-8 make -j1 test" &> vim-test.log
make install

ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done

ln -sv ../vim/vim90/doc /usr/share/doc/vim-9.0.0228

cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF

#vim -c ':options'
#set spelllang=en,ru
#set spell

popd
rm -rf ${PK_VIM}
# build-${PK_VIM} ends 



# Eudev-3.2.11		0.2 SBU	83MB
tar -xf ${PK_EUDEV}.tar.gz
echo "Start building  ${PK_EUDEV}"
pushd ${PK_EUDEV}

./configure --prefix=/usr           \
            --bindir=/usr/sbin      \
            --sysconfdir=/etc       \
            --enable-manpages       \
            --disable-static

make -j4
mkdir -pv /usr/lib/udev/rules.d
mkdir -pv /etc/udev/rules.d
#make check
make install

tar -xvf ../udev-lfs-20171102.tar.xz
make -f udev-lfs-20171102/Makefile.lfs install

udevadm hwdb --update

popd
rm -rf ${PK_EUDEV}
# build-${PK_EUDEV} ends 



# Man-DB-2.10.2		0.4 SBU	40MB
tar -xf ${PK_MAN_DB}.tar.xz
echo "Start building  ${PK_MAN_DB}"
pushd ${PK_MAN_DB}

./configure --prefix=/usr                         \
            --docdir=/usr/share/doc/man-db-2.10.2 \
            --sysconfdir=/etc                     \
            --disable-setuid                      \
            --enable-cache-owner=bin              \
            --with-browser=/usr/bin/lynx          \
            --with-vgrind=/usr/bin/vgrind         \
            --with-grap=/usr/bin/grap             \
            --with-systemdtmpfilesdir=            \
            --with-systemdsystemunitdir=

make -j4
#make check
make install

popd
rm -rf ${PK_MAN_DB}
# build-${PK_MAN_DB} ends 



# Procps-ng-4.0.0	0.1 SBU	19MB
tar -xf ${PK_PROCPS_NG}.tar.xz
echo "Start building  ${PK_PROCPS_NG}"
pushd ${PK_PROCPS_NG}

./configure --prefix=/usr                            \
            --docdir=/usr/share/doc/procps-ng-4.0.0 \
            --disable-static                         \
            --disable-kill

make -j4
#make check
make install

popd
rm -rf ${PK_PROCPS_NG}
# build-${PK_PROCPS_NG} ends 



# Util-linux-2.38.1	1.0 SBU	283MB
tar -xf ${PK_UTIL_LINUX}.tar.xz
echo "Start building  ${PK_UTIL_LINUX}"
pushd ${PK_UTIL_LINUX}

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --bindir=/usr/bin    \
            --libdir=/usr/lib    \
            --sbindir=/usr/sbin  \
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
            --without-systemd    \
            --without-systemdsystemunitdir

make -j4
make install

popd
rm -rf ${PK_UTIL_LINUX}
# build-${PK_UTIL_LINUX} ends 



# E2fsprogs-1.46.5	1.2 SBU	94MB
tar -xf ${PK_E2FSPROGS}.tar.gz
echo "Start building  ${PK_E2FSPROGS}"
pushd ${PK_E2FSPROGS}

mkdir -v build
cd       build

../configure --prefix=/usr           \
             --sysconfdir=/etc       \
             --enable-elf-shlibs     \
             --disable-libblkid      \
             --disable-libuuid       \
             --disable-uuidd         \
             --disable-fsck

make -j4
make install
rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
gunzip -v /usr/share/info/libext2fs.info.gz
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info

makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
install -v -m644 doc/com_err.info /usr/share/info
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info

popd
rm -rf ${PK_E2FSPROGS}
# build-${PK_E2FSPROGS} ends 



# Sysklogd-1.5.1	0.1 SBU	0.6MB
tar -xf ${PK_SYSKLOGD}.tar.gz
echo "Start building  ${PK_SYSKLOGD}"
pushd ${PK_SYSKLOGD}

sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
sed -i 's/union wait/int/' syslogd.c

make -j4
make BINDIR=/sbin install

cat > /etc/syslog.conf << "EOF"
# Begin /etc/syslog.conf

auth,authpriv.* -/var/log/auth.log
*.*;auth,authpriv.none -/var/log/sys.log
daemon.* -/var/log/daemon.log
kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
*.emerg *

# End /etc/syslog.conf
EOF

popd
rm -rf ${PK_SYSKLOGD}
# build-${PK_SYSKLOGD} ends 



# Sysvinit-3.04		0.1 SBU	2.7MB
tar -xf ${PK_SYSVINIT}.tar.xz
echo "Start building  ${PK_SYSVINIT}"
pushd ${PK_SYSVINIT}

patch -Np1 -i ../sysvinit-3.04-consolidated-1.patch
make -j4
make install

popd
rm -rf ${PK_SYSVINIT}
# build-${PK_SYSVINIT} ends 
