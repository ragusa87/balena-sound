# IoTSound

This is a fork of Balena-Sound project <https://github.com/iotsound/iotsound.git>


# Added features

- Mount drive and start mpd
- Control MPD via IR. Using a config file to map IR buttons to commands
- Add MPRIS support to control MPD via DBus

# Pi 4 fix USB drive speed

lsusb
vi /mnt/boot/config.txt

```
usb-storage.quirks=152d:1576:u
```


# IoTSound

**Starter project enabling you to add multi-room audio streaming via Bluetooth, Airplay2, Spotify Connect and others to any old speakers or Hi-Fi using just a Raspberry Pi.**

IoTSound, formerly balenaSound, was developed in 2019 to showcase the capabilities of the [balena IoT platform](https://www.balena.io/) which provides powerful edge device management at scale. Unfortunately, balenaSound has not connected with its intended audience: the commercial and industrial IoT space where the balena platform has thrived. Rather than archive and discontinue balenaSound, we are separating it from balena and gifting it to the hobbyist audio community that has been so passionate about it over the past years. 

