![logo](https://raw.githubusercontent.com/balena-io-projects/balena-sound/master/docs/images/balenaSound-logo.png)

This is a fork of Balena-Sound project <https://github.com/balena-labs-projects/balena-sound>


# Added features

- Mount drive and start mpd

# Pi 4 fix USB drive speed

lsusb
vi /mnt/boot/config.txt

```
usb-storage.quirks=152d:1576:u
```



# MPrism

dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus'
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.mpd /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus'