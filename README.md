# archlinux-vnc-container
Archlinux image with installed XFCE, Firefox and TigerVNC for remote access
## Run via build
```
git clone https://github.com/AllowDeny0123/archlinux-vnc-container.git
cd archlinux-vnc-container
docker build -t archlinux-vnc .
docker run -it --rm -e password='*FILL DESIRED VNC PASSWORD*' -p5901:5901 archlinux-vnc
```
## Run via DockerHub
```
docker run -it --rm -e password='*FILL DESIRED VNC PASSWORD*' -p5901:5901 allowdeny/archlinux-vnc
```
## After container built or pulled
I prefer to use TightVNC client but you can use any VNC client you want and connect to *IP*:5901 with password you set in `docker run` command.
