# ut4hub
Docker image for a stock install of a UT4 hub

# Build
`docker build --add-host=dc.wtf:192.168.0.99 -t ut4hub .`

# Run
Modify `docker-compose.yml.sample` with your settings (Hub name, MOTD, Rcon password)
Launch with `docker-compose up -d`
