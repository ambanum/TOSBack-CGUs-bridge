# TOSBack CGUs bridge

Usage:
* get a server with Ubuntu 20.04, 16Gb memory, and 8 CPUs.
* ssh into it
* Run `tmux new` so that you can disconnect and come back later with `tmux ls ; tmux attach`
* Run:
```sh
curl -o- https://raw.githubusercontent.com/ambanum/TOSBack-CGUs-bridge/master/prepare.sh | bash
```
* Wait for about 10 minutes
* Add the ssh key to the github account of https://github.com/TosbackCgusBridge-Bot
* While still in the `tmux` session, run:
```sh
cd TOSBack-CGUs-bridge
sh ./prepare2.sh
sh ./run.sh
```
* You can now disconnect from your `tmux` session and come back several hours later (note to self: started 15:30)
* Check out the `import-123456789` and `rebased-123456789` branches for:
  - [snapshots](https://github.com/TosbackCgusBridge-Bot/CGUs-snapshots/branches)
  - [versions](https://github.com/TosbackCgusBridge-Bot/CGUs-versions/branches)
  - [rules](https://github.com/TosbackCgusBridge-Bot/CGUs/branches)
