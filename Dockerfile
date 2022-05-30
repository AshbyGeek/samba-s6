FROM p3terx/s6-alpine:latest

ENV USERNAME samba
ENV PASSWORD password
ENV UID 1000
ENV GID 1000

RUN apk add --no-cache samba-server samba-common-tools openssl

COPY s6/config.init /etc/cont-init.d/00-config
COPY s6/smbd.run /etc/services.d/smbd/run
COPY s6/nmbd.run /etc/services.d/nmbd/run
COPY smb.conf /etc/samba/smb.conf

EXPOSE 137/udp 138/udp 139/tcp 445/tcp

ENTRYPOINT ["/init"]
