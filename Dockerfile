from archlinux:latest

RUN pacman -Syu --noconfirm xfce4 sudo tigervnc expect firefox

ENV HOME=/home/headless

RUN useradd headless && \
	groupadd sudo && usermod -aG sudo headless && \
	echo "archlinux" | passwd --stdin root && \
	echo "archlinux" | passwd --stdin headless
RUN mkdir -p ${HOME}/
COPY ./start.sh ${HOME}/.
COPY ./bashrc ${HOME}/.bashrc
RUN mkdir -p ${HOME}/.vnc \
	&& \
	echo '#!/bin/sh' > ${HOME}/.vnc/xstartup && \
	echo 'exec startxfce4' >> ${HOME}/.vnc/xstartup && \
	chmod 775 ${HOME}/.vnc/xstartup \
	&& \
	chown headless:headless -R ${HOME}
RUN echo "%sudo ALL=(ALL:ALL) ALL" >> /etc/sudoers
WORKDIR ${HOME}
USER headless
ENTRYPOINT ["expect", "./start.sh"]

