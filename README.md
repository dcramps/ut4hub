# ut4hub
Docker image for a stock install of a UT4 hub

# Build
`docker build -t ut4hub .`

# Configuration 

## Directories
Create a directory to hold some necessary files to launch the hub:

- `/home/docker/ut4hub/config` 
- `/home/docker/ut4hub/paks`
- `/home/docker/ut4hub/rules`

These folders can be anywhere and named anything, as long as they map to `/config`, `/paks`, and `/rules` in the volumes section of the docker-compose.yml file

### /config
This directory should contain a file named `reidrect.ini`. The file should contain `RedirectReferences` for whatever redirect server you're using. Example:

```
RedirectReferences=(PackageName="DM-Alanis-WindowsNoEditor",PackageURLProtocol="https",PackageURL="example.com/redirect/DM-Alanis-WindowsNoEditor.pak",PackageChecksum="MD5SumOfAlanis")
RedirectReferences=(PackageName="MutTeamSkins-WindowsNoEditor",PackageURLProtocol="https",PackageURL="example.com/redirect/MutTeamSkins-WindowsNoEditor.pak",PackageChecksum="MD5SumOfTeamSkins")
```

### /paks

This directory should only contain valid pak files for maps, mutators, gametypes, etc

### /rules

This directory should contain `.json` files containing server rulesets. You can build these on UTCC or use your own.

## Environment Variables

The following environment variables can be specified in docker-compose.yml

- `SERVERNAME` - name to be displayed in the hub browser. Default is "UT4 Docker Hub"
- `SERVERMOTD` - MOTD shown when in the hub lobby. Default is "A UT4 Docker Hub!"
- `SERVERRCON` - admin password used with `rconauth <somepassword>`. Default is "asdf1234"
- `SERVERTICKRATE` - server tickrate. Default is 90, max is 120
- `SERVERNETSPEED` - client netspeed. Default is 24000, max is 24000

# Run
Modify `docker-compose.yml.sample` with your settings 
Launch with `docker-compose up -d`

