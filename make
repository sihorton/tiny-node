#!/bin/sh
SCRIPTABS=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPTABS`
SCRIPT=`basename $0`

export CFLAGS="-march=i486 -mtune=i686 -Os -pipe"
export CXXFLAGS="-march=i486 -mtune=i686 -Os -pipe"
export LDFLAGS="-Wl,-O1"

if [ -z "$1" ]
then
   echo "missing node version, e.g. sudo ./$SCRIPT v0.8.18"
   exit
fi

mkdir -p "$SCRIPTPATH/../src"
cd "$SCRIPTPATH/../src"
git checkout master
git pull
git checkout "$1"
mkdir -p $SCRIPTPATH/../build
./configure --prefix=$SCRIPTPATH/../build
make && make install


