#!/bin/bash

# 06/01/2023 by cjung-mo 
# https://www.linuxfromscratch.org/lfs/view/stable/chapter06/introduction.html
# linux from scratch - version 11.2
# chapter 6. cross compiling temporary tools

# ------- Included Packages -------- 
# package name	     build time space
# ----------------------------------
# M4-1.4.19		0.2 SBU	32MB
# Ncurses-6.3		0.7 SBU	50MB
# Bash-5.1.16		0.5 SBU	64MB
# Coreutils-9.1		0.6 SBU	163MB
# Diffutils-3.8		0.2 SBU	26MB
# File-5.42		0.2 SBU	34MB
# Findutils-4.9.0	0.2 SBU	42MB
# Gawk-5.1.1		0.2 SBU	45MB
# Grep-3.7		0.2 SBU	25MB
# Gzip-1.12		0.1 SBU	11MB
# Make-4.3		0.1 SBU	15MB
# Patch-2.7.6		0.1 SBU	12MB
# Sed-4.8		0.1 SBU	20MB
# Tar-1.34		0.2 SBU	38MB
# Xz-5.2.6		0.1 SBU 16MB
#                   +  -------------
#  		    =	3.7 SBU	593MB
# Binutils-2.39 pass 2	1.4 SBU	514MB
# GCC-12.2.0 pass 2	 15 SBU	4.5GB
#                   +  --------------
#  		    =  20.1 SBU	5.6GB
# ----------------------------------

set -xe
# PK_M4='m4-1.4.19'
# PK_NCURSES='ncurses-6.3'
# PK_BASH='bash-5.1.16'
# PK_COREUTILS='coreutils-9.1'
# PK_DIFFUTILS='diffutils-3.8'
# PK_FILE='file-5.42'
# PK_FINDUTILS='findutils-4.9.0'
# PK_GAWK='gawk-5.1.1'
# PK_GREP='grep-3.7'
# PK_GZIP='gzip-1.12'
# PK_MAKE='make-4.3'
# PK_PATCH='patch-2.7.6'
# PK_SED='sed-4.8'
# PK_TAR='tar-1.34'
# PK_XZ='xz-5.2.6'
# PK_BINUTILS='binutils-2.39'
# PK_GCC='gcc-12.2.0'

cd ${LFS}/sources


# M4-1.4.19		0.2 SBU	32MB
tar -xf m4-1.4.19.tar.xz
echo 'start building  m4-1.4.19'
pushd 'm4-1.4.19'

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
	
make -j4
make DESTDIR=$LFS install

popd
rm -rf 'm4-1.4.19'
# build-m4 ends 



# Ncurses-6.3		0.7 SBU	50MB
tar -xf ncurses-6.3.tar.gz
echo 'start building  ncurses-6.3'
pushd 'ncurses-6.3'

sed -i s/mawk// configure

mkdir build
pushd build
  ../configure
  make -C include
  make -C progs tic
popd

./configure --prefix=/usr                \
            --host=$LFS_TGT              \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-normal             \
            --with-cxx-shared            \
            --without-debug              \
            --without-ada                \
            --disable-stripping          \
            --enable-widec


make -j4
make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so

popd
rm -rf 'ncurses-6.3'
# build-ncurses ends 



# Bash-5.1.16		0.5 SBU	64MB
tar -xf bash-5.1.16.tar.gz
echo 'start building  bash-5.1.16'
pushd 'bash-5.1.16'

./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc


make -j4
make DESTDIR=$LFS install
ln -sv bash $LFS/bin/sh

popd
rm -rf 'bash-5.1.16'
# build-bash ends 



# Coreutils-9.1		0.6 SBU	163MB
tar -xf coreutils-9.1.tar.xz
echo 'start building  coreutils-9.1'
pushd 'coreutils-9.1'

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime



make -j4
make DESTDIR=$LFS install

mv -v $LFS/usr/bin/chroot              $LFS/usr/sbin
mkdir -pv $LFS/usr/share/man/man8
mv -v $LFS/usr/share/man/man1/chroot.1 $LFS/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/'                    $LFS/usr/share/man/man8/chroot.8

popd
rm -rf 'coreutils-9.1'
# build-coreutils-9.1 ends 



# Diffutils-3.8		0.2 SBU	26MB
tar -xf diffutils-3.8.tar.xz
echo 'start building  diffutils-2.7'
pushd 'diffutils-3.8'

./configure --prefix=/usr --host=$LFS_TGT
make -j4
make DESTDIR=$LFS install

popd
rm -rf 'diffutils-3.8'
# build-diffutils-3.8 ends 



# File-5.42		0.2 SBU	34MB
tar -xf file-5.42.tar.gz
echo 'start building  file-5.42'
pushd 'file-5.42'

mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)

make FILE_COMPILE=$(pwd)/build/src/file

make DESTDIR=$LFS install

rm -v $LFS/usr/lib/libmagic.la

popd
rm -rf 'file-5.42'
# build-file-5.42 ends 



# Findutils-4.9.0	0.2 SBU	42MB
tar -xf findutils-4.9.0.tar.xz
echo 'start building  findutils-4.9.0'
pushd 'findutils-4.9.0'

./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
            --build=$(build-aux/config.guess)


make -j4
make DESTDIR=$LFS install

popd
rm -rf 'findutils-4.9.0'
# build-findutils-4.9.0 ends 



# Gawk-5.1.1		0.2 SBU	45MB
tar -xf gawk-5.1.1.tar.xz
echo 'start building  gawk-5.1.1'
pushd 'gawk-5.1.1'

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make -j4
make DESTDIR=$LFS install

popd
rm -rf 'gawk-5.1.1'
# build-gawk-5.1.1 ends 



# Grep-3.7		0.2 SBU	25MB
tar -xf grep-3.7.tar.xz
echo 'start building  grep-3.7'
pushd 'grep-3.7'

./configure --prefix=/usr   \
            --host=$LFS_TGT
make
make DESTDIR=$LFS install

popd
rm -rf 'grep-3.7'
# build-grep-3.7 ends 



# Gzip-1.12		0.1 SBU	11MB
tar -xf gzip-1.12.tar.xz
echo 'start building  gzip-1.12'
pushd 'gzip-1.12'

./configure --prefix=/usr --host=$LFS_TGT
make -j4
make DESTDIR=$LFS install

popd
rm -rf 'gzip-1.12'
# build-gzip-1.12 ends 



# Make-4.3		0.1 SBU	15MB
tar -xf make-4.3.tar.gz
echo 'start building  make-4.3'
pushd 'make-4.3'

./configure --prefix=/usr   \
            --without-guile \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make -j4
make DESTDIR=$LFS install

popd
rm -rf 'make-4.3'
# build-make-4.3 ends 



# Patch-2.7.6		0.1 SBU	12MB
tar -xf patch-2.7.6.tar.xz
echo 'start building  patch-2.7.6'
pushd 'patch-2.7.6'

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make -j4
make DESTDIR=$LFS install

popd
rm -rf 'patch-2.7.6'
# build-patch-2.7.6 ends 



# Sed-4.8		0.1 SBU	20MB
tar -xf sed-4.8.tar.xz
echo 'start building  sed-4.8'
pushd 'sed-4.8'

./configure --prefix=/usr   \
            --host=$LFS_TGT
make -j4
make DESTDIR=$LFS install

popd
rm -rf 'sed-4.8'
# build-sed-4.8 ends 



# Tar-1.34		0.2 SBU	38MB
tar -xf tar-1.34.tar.xz
echo 'start building  tar-1.34'
pushd 'tar-1.34'

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess)
make -j4
make DESTDIR=$LFS install

popd
rm -rf 'tar-1.34'
# build-tar-1.34 ends 



# Xz-5.2.6		0.1 SBU 16MB
tar -xf xz-5.2.6.tar.xz
echo 'start building  xz-5.2.6'
pushd 'xz-5.2.6'

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.2.6
make -j4
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/liblzma.la

popd
rm -rf 'xz-5.2.6'
# build-xz-5.2.6 ends 



# binutils-2.39 pass 2	1.4 sbu	514mb
tar -xf binutils-2.39.tar.xz
echo 'start building  binutils-2.39'
pushd 'binutils-2.39'

sed '6009s/$add_dir//' -i ltmain.sh

mkdir -v build
cd       build

../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --enable-gprofng=no        \
    --disable-werror           \
    --enable-64-bit-bfd

make -j4
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.{a,la}

popd
rm -rf 'binutils-2.39'
# build-binutils-2.39 ends 



# gcc-12.2.0 pass 2	 15 sbu	4.5gb
tar -xf gcc-12.2.0.tar.xz
echo 'start building  gcc-12.2.0'
pushd 'gcc-12.2.0'

tar -xf ../mpfr-4.1.0.tar.xz
mv -v mpfr-4.1.0 mpfr
tar -xf ../gmp-6.2.1.tar.xz
mv -v gmp-6.2.1 gmp
tar -xf ../mpc-1.2.1.tar.gz
mv -v mpc-1.2.1 mpc

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
  ;;
esac
sed '/thread_header =/s/@.*@/gthr-posix.h/' \
    -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in

mkdir -v build
cd       build

../configure                                       \
    --build=$(../config.guess)                     \
    --host=$LFS_TGT                                \
    --target=$LFS_TGT                              \
    LDFLAGS_FOR_TARGET=-L$PWD/$LFS_TGT/libgcc      \
    --prefix=/usr                                  \
    --with-build-sysroot=$LFS                      \
    --enable-initfini-array                        \
    --disable-nls                                  \
    --disable-multilib                             \
    --disable-decimal-float                        \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libssp                               \
    --disable-libvtv                               \
    --enable-languages=c,c++

make -j4
make DESTDIR=$LFS install
ln -sv gcc $LFS/usr/bin/cc

popd
rm -rf 'gcc-12.2.0'
# build-gcc-12.2.0 ends 
