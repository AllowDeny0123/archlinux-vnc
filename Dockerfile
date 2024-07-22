from archlinux:latest

RUN pacman -Sy --noconfirm xfce4 tigervnc expect firefox

ENV HOME=/home/headless

RUN useradd headless && \
	echo "archlinux" | passwd --stdin root && \
	echo "archlinux" | passwd --stdin headless
RUN mkdir -p ${HOME}/
COPY ./start.sh ${HOME}/.

RUN mkdir -p ${HOME}/.vnc \
	&& \
	echo '#!/bin/sh' > ${HOME}/.vnc/xstartup && \
	echo 'exec startxfce4' >> ${HOME}/.vnc/xstartup && \
	chmod 775 ${HOME}/.vnc/xstartup \
	&& \
	chown headless:headless -R ${HOME}

WORKDIR ${HOME}
USER headless
ENTRYPOINT ["expect", "./start.sh"]

