# TOSBack CGUs bridge

Usage:
* get a server with Ubuntu 20.04, 16Gb memory, and 8 CPUs.
* ssh into it
* Run:
```sh
curl -o- https://raw.githubusercontent.com/ambanum/TOSBack-CGUs-bridge/master/prepare.sh | bash
```
* Wait for about 10 minutes
* Add the ssh key to the github account of https://github.com/TosbackCgusBridge-Bot
* Run:
```sh
cd TOSBack-CGUs-bridge
sh ./run.sh
```
* Wait for several hours (note to self: started 15:30)
* Check out the `import-123456789` and `rebased-123456789` branches for:
  - [snapshots](https://github.com/TosbackCgusBridge-Bot/CGUs-snapshots/branches)
  - [versions]https://github.com/TosbackCgusBridge-Bot/CGUs-versions/branches)
  - [rules](https://github.com/TosbackCgusBridge-Bot/CGUs/branches)
