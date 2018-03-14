# Open vSwitch
Docker image of [Open vSwitch](http://www.openvswitch.org/) with ssh enabled running over [supervisord](http://supervisord.org/).
This is a very small docker image built on top of [Alpine](https://alpinelinux.org/) distribution.

## Image

The image is hosted at DockerHub as [globocom/openvswitch](https://hub.docker.com/r/globocom/openvswitch/).

## How to use

Simple run:
```bash
$> docker run -it --rm --name vswitch --cap-add=NET_ADMIN -d globocom/openvswitch
```

> As it is a virtual switch, it uses some network resources from the underlying operation system.
> For that we need to use --cap-add=NET_ADMIN to allow that kind of capability

## How to build

If you want to build this image manually do as follows:
```bash
$> docker build --tag openvswitch .
```
Then just run:
```bash
$> docker run -it --rm --name vswitch --cap-add=NET_ADMIN -d openvswitch
```
