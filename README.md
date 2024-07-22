# archlinux-vnc-container
Archlinux image with installed XFCE, Firefox and TigerVNC for remote access
## Run via build
`git clone https://github.com/AllowDeny0123/archlinux-vnc-container.git
cd archlinux-vnc-container
docker build -t archlinux-vnc .
docker run -it --rm -e password='*FILL DESIRED VNC PASSWORD*' archlinux-vnc
`
## Run via DockerHub
`docker run -it --rm -e password='*FILL DESIRED VNC PASSWORD*' allowdeny/archlinux-vnc
`
