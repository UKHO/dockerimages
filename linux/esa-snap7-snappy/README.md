# esa-snap7-snappy

This image provides a base for using the European Space Agency (ESA)'s SNAP (Sentinel Application Platform) tooling and it's Python binding `snappy`.

The purpose of this image is to provide a way to utilise the functionality of SNAP and snappy inside a cloud environment.

## Versions

|Software|Version|
|--------|-------|
|OpenJDK |8      |
|SNAP    |7      |
|Python  |3.6    |

# Usage

The container has no entrypoint, but you can run it with:

```
$ docker run -it ukhydrograpicoffice/esa-snap7-snappy:latest bash
```

Once inside the container, you can use the `gpt` command line tool like so:

```
$ /opt/snap/bin/gpt -h
```

If you wish to use `snappy`:

```
$ python3.6
import snappy
```
