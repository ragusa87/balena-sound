![logo](https://raw.githubusercontent.com/balena-io-projects/balena-sound/master/docs/images/balenaSound-logo.png)

This is a fork of Balena-Sound project <https://github.com/balena-labs-projects/balena-sound>


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
