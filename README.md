MEGA65-SDK
==========

This SDK is just a repository including all compontents provided from external
repositories. These repositories are:
- [cc65](https://github.com/cc65/cc65)
- [m65dbg](https://github.com/MEGA65/m65dbg)
- [xemu](https://github.com/lgblgblgb/xemu)

After checking out run
```
make update
```
This will fetch the repositories needed for building the SDK. It will also
update these sub-repositories after running a "git pull".

To build the SDK run the following steps:
```
make install
```
This will install SDK to the current directory in the subdirectory "usr". You
can also run
```
make install prefix=/opt/mega65-sdk
```
to install it to a system directory.

