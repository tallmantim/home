docker run -d \
--name=sonarr \
--restart=unless-stopped \
--net=host \
-p 8989:8989 \
-e PGID=1001 -e PUID=1001 \
-v /app/docker/sonarr/config:/config \
-e TZ=Australia/Melbourne \
-v /home/share/tvshows:/tv \
-v /home/share/downloads:/downloads \
linuxserver/sonarr


docker run -d \
--name=radarr \
--restart=unless-stopped \
--net=host \
-p 7878:7878 \
-e PGID=1001 -e PUID=1001 \
-v /app/docker/radarr/config:/config \
-e TZ=Australia/Melbourne \
-v /home/share/movies:/movies \
-v /home/share/downloads:/downloads \
linuxserver/radarr



docker run -d \
  --name=jackett \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Australia/Melbourne \
  -p 9117:9117 \
  -v /app/docker/jackett:/config \
  -v /home/share/downloads:/downloads \
  --restart unless-stopped \
  linuxserver/jackett



docker run -d \
    --cap-add=NET_ADMIN \
    --net=bridge \
    -p 8112:8112 \
    -p 8118:8118 \
    -p 58846:58846 \
    -p 58946:58946 \
    --name=deluge \
    -v /home/share/downloads:/data \
    -v /app/docker/deluge/config:/config \
    -v /home/share/downloads:/downloads \
    -v /etc/localtime:/etc/localtime:ro \
    -e VPN_ENABLED=yes \
    -e VPN_USER=<username> \
    -e VPN_PASS=<userpass> \
    -e VPN_PROV=pia \
    -e STRICT_PORT_FORWARD=yes \
    -e ENABLE_PRIVOXY=yes \
    -e LAN_NETWORK=192.168.1.0/24 \
    -e NAME_SERVERS=209.222.18.222,37.235.1.174,1.1.1.1,8.8.8.8,209.222.18.218,37.235.1.177,1.0.0.1,8.8.4.4 \
    -e DELUGE_DAEMON_LOG_LEVEL=info \
    -e DELUGE_WEB_LOG_LEVEL=info \
    -e DEBUG=false \
    -e UMASK=000 \
    -e PUID=0 \
    -e PGID=0 \
    --restart=unless-stopped \
    binhex/arch-delugevpn

docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 8080:80 \
    -p 443:443 \
    -e TZ="Australia/Melbourne" \
    -v /app/docker/pihole/etc-pihole/:/etc/pihole/ \
    -v /app/docker/pihole/etc-dnsmasq.d/:/etc/dnsmasq.d/ \
    --dns=192.168.1.1 --dns=1.1.1.1 \
    --restart=unless-stopped \
    pihole/pihole:latest


docker run -d \
--name plex \
--network=host \
-e TZ="Australia/Melbourne" \
-v /app/docker/plex/config:/config \
-v /app/docker/plex/transcode:/transcode \
-v /home/share:/data \
plexinc/pms-docker






docker run -d \
--name home-assistant \
-v /app/docker/home-assistant:/config \
-v /etc/localtime:/etc/localtime:ro \
--net=host \
homeassistant/home-assistant



docker run -d \
--name mosquitto \
--network=host \
-p 1883:1883 \
-p 9001:9001 \
-v mosquitto.conf:/mosquitto/config/mosquitto.conf \
-v data:/mosquitto/data \
-v log:/mosquitto/log \
eclipse-mosquitto


docker run -d \
   --name zigbee2mqtt \
   -v /app/docker/zigbee2mqtt/data:/app/data \
   --device=/dev/ttyACM0 \
   koenkk/zigbee2mqtt


