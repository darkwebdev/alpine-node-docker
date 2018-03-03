FROM library/node:8.9.4-alpine

RUN \
echo http://dl-cdn.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
apk add --no-cache git coreutils tzdata shadow

RUN \
groupmod -g 911 users && \
useradd -u 911 -U -d /app -s /bin/false app && \
usermod -G users app && \
mkdir -p /app && \
chown app:users /app && \
chmod u=rwx,go=rx /app
