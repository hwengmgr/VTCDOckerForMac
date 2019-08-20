#!/bin/bash

#cd /root/bitcoin
export WORKSPACE=`pwd`
rm -rf build


export HOST=x86_64-apple-darwin14
curl -O https://bitcoincore.org/depends-sources/sdks/MacOSX10.11.sdk.tar.gz
mkdir -p $WORKSPACE/depends/SDKs
tar xzf MacOSX10.11.sdk.tar.gz -C depends/SDKs/ --overwrite

make -j8 -C depends HOST=$HOST
mkdir -p $WORKSPACE/out/$HOST
./autogen.sh
#mkdir build && cd build
./configure --disable-tests  --with-libs=no --prefix=$WORKSPACE/depends/$HOST --bindir=$WORKSPACE/out/$HOST/bin --libdir=$WORKSPACE/out/$HOST/lib 
make -j8 install
#cd ../
#rm -rf build
#rm -rf /root/output/$HOST
#mv $WORKSPACE/out/$HOST /root/output/$HOST

#zip /root/output/bitcoind-windows-x64.zip /root/output/x86_64-w64-mingw32/bin/bitcoind.exe /root/output/x86_64-w64-#mingw32/bin/bitcoin-tx.exe /root/output/x86_64-w64-mingw32/bin/bitcoin-cli.exe
#zip /root/output/bitcoin-qt-windows-x64.zip /root/output/x86_64-w64-mingw32/bin/bitcoin-qt.exe

echo Done at
date

