docker stop ut4hub
docker rm ut4hub
docker build --add-host=dc.wtf:192.168.0.99 -t ut4hub .
