# Intro

This is a docker template for conda user. You can use it to build your own conda image. Edit the requirements.txt to change the preinstalled pip modules, and build the docker image.

## Customize

If you want to add more depedency or install module from conda, you **Should** add the command just before add app.py.

# Build

```shell
docker build conda:tag .
```

# Run

```shell
docker pull aak1247/conda:3-5.3.1-ubuntu-18.04
```

```shell
docker run --runtime=nvidia --device=/dev/nvidia0 IMAGE_ID
```
