# Raspberry Pi Assistant Relay Docker

Creates a docker image for use on a Raspberry Pi Model B Rev 2.  I have no idea if it will work on other Raspberry Pi 
but I suspect not because it is based on a node container targeted for arm32v6.

See See https://github.com/greghesp/assistant-relay to see how it works and for the release notes.

This work was based on inspiration from https://github.com/Apipa169/Assistant-Relay-Docker.

# Installation
Create a file in the volume called "config.json" before starting the container:

```json
{
    "port":3000
}
```
Change the number to the port you want to use.

#### Docker Run
```bash
docker run -dit --name assistant_relay -p 3000:3000 \
-v $(realpath ~/config.json):/assistant_relay/bin/config.json:rw \
-v $(realpath ~/audio-responses):/assistant_relay/bin/audio-responses:rw \
--restart unless-stopped \
bencardinal/assistant-relay-arm32v6:latest
```

