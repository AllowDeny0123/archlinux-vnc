# archlinux-vnc
Archlinux image with installed XFCE, Firefox and TigerVNC for remote access
## Run via build
```
git clone https://github.com/AllowDeny0123/archlinux-vnc.git
cd archlinux-vnc
docker build -t archlinux-vnc .
docker run -it --rm -e password='*FILL DESIRED VNC PASSWORD*' -p5901:5901 archlinux-vnc
```
## Run via DockerHub
```
docker run -it --rm -e password='*FILL DESIRED VNC PASSWORD*' -p5901:5901 allowdeny/archlinux-vnc
```
## After container built or pulled
I prefer to use TightVNC client but you can use any VNC client you want and connect to *IP*:5901 with password you set in `docker run` command.

## Notes
If `--rm` flag persist in your run command container will be deleted after you log out from DE inside container otherwise it just stops
