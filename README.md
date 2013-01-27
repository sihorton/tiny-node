tiny-node
=========

nodejs extension for tinycorelinux.

First time setup
================
Built successfully on CorePlus-4.7.3.iso
tcz extensions:
tce-load -i -w git
tce-load -i -w curl
tce-load -i -w expat2
git clone http://github.com/sihorton/tiny-node.git

tce-load -i -w compiletc
tce-load -i -w make
tce-load -i -w python
tce-load -i -w openssl-1.0.0.tcz
tce-load -i -w openssl-1.0.0-dev.tcz
tce-load -i -w squashfs-tools-4.x.tcz

git clone https://github.com/joyent/node.git src
cd tiny-node
sudo ./make v0.8.18

#find out where /etc/sysconfig/tcedir links to
#create a file /opt/.tce_dir text file with path found in previous link (with a carrage return at the end).
/mnt/sda1/tce/
wget http://tcztools.googlecode.com/hg/tcztools.tcz -cP "$(cat /opt/.tce_dir)/optional"
tce-load -i tcztools

sudo ./package

#to test reboot and then
tce-load -i nodejs
tce-load -i nodejs-doc

#standard tests....
$ man node
$ node
process.version
$ npm
$ npm install sqlite3

## Rebuild
After a new node version is released, follow these steps
tce-load -i tcztools
cd tiny-node
sudo ./make v0.8.18
sudo ./package
sudo ./submit

