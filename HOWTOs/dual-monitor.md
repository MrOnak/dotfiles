# dual monitor support for raspberry pi 4 

Insert parameters in `/boot/firmware/config.txt`

```
dtoverlay=vc4-fkms-v3d
max_framebuffers=2
```

The dtoverlay somehow reduced OpenGL support to v2.0, maybe there is a better
one but this one works.
