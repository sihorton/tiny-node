tiny-node
=========

nodejs extension for tinycorelinux.

Built successfully on `CorePlus-4.7.3.iso` and `Core-5.3.iso`.


First time setup
----------------

Load tcz extensions and clone git repositories:

```sh
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
```

To build specific version from git repository, checkout it's branch first. For example, to switch source to the 0.10.26 version:

```sh
cd src
git checkout -b v0.10.26 origin/v0.10.26-release
cd ..
```

Build node (version number just sets it, and does not really switch to build specific version from git repository, you have to do it manually):

```sh
cd tiny-node
sudo ./make v0.10.26
```

Find out where `/etc/sysconfig/tcedir` links to and create `/opt/.tce_dir` text file with path found in previous link (with a carrage return at the end). Here it was pointing to `/mnt/sda1/tce/`.

```sh
readlink /etc/sysconfig/tcedir > /opt/.tce_dir
```

Download and load tcz tools:

```sh
wget http://tcztools.googlecode.com/hg/tcztools.tcz -cP "$(cat /opt/.tce_dir)/optional"
tce-load -i tcztools
```

Create nodejs and nodejs-doc packages:

```sh
sudo ./package
```

Finally, test by rebooting and then loading nodejs modules:

```sh
tce-load -i nodejs
tce-load -i nodejs-doc
```

Standard tests..."

```sh
$ man node
$ node
process.version
process.exit();
$ npm
$ npm install sqlite3
```


Rebuild
-------

After a new node version is released, follow these steps:

```sh
tce-load -i tcztools
cd tiny-node
sudo ./make v0.8.18
sudo ./package
```


Submit extension
----------------

Rebuild and then:

```sh
sudo ./submit
```
