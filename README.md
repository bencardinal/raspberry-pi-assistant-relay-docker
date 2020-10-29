![Supports amd64 Architecture][amd64-shield]
![Supports armv7 Architecture][armv6-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports aarch64 Architecture][aarch64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports i386 Architecture][i386-shield]
![Maintained][maintained-shield]

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

[aarch64-shield]: https://img.shields.io/badge/aarch64-no-red.svg
[amd64-shield]: https://img.shields.io/badge/amd64-no-red.svg
[armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[armv7-shield]: https://img.shields.io/badge/armv7-no-red.svg
[armv6-shield]: https://img.shields.io/badge/armv6-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-no-red.svg
[maintained-shield]: https://img.shields.io/badge/maintained-no-red.svg
