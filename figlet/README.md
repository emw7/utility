# figlet

Runs [figlet](http://www.figlet.org/) (creates text banners) as a docker app.

# Copyright

Copyright 2024 Enrico Maschietto &lt;emw7.github.fraying845@simplelogin.com&gt;

## Licensing

figlet is licensed under [Apache License 2.0](../LICENSE)

You must consider all files present in https://github.com/emw7/utility/blob/main/figlet contains the following text:

<pre>
Copyright 2024 Enrico Maschietto &lt;emw7.github.fraying845@simplelogin.com&gt;

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>

# ChangeLog

[CHANGELOG](./CHANGELOG)

# Prerequisites

**Note**: the lists below could not be exahustive.

These are the prerequistes for running figlet:
- docker

These are the prerequistes needed for installing figlet:
- docker

# Installation

The procedures described below in part depends on the [figlet architecture and desig](#architecture-and-design).

There are some options for installing figlet:
1. Full installation.
1. Minimal installation.
1. Do not install at all.

## Full installation

These are the steps to follow to do a  full installation:
- Copy `figlet.sh` file to `/usr/local/bin`.
- Copy `build-image.sh` files and `figlet-fonts` directory to `/usr/local/share/figlet`.  
- Make both `figlet.sh` and `build-image.sh` files executable.  
- Change directory into `/usr/local/share/figlet` and runs (ont-time step) `./build-image.sh` to create the figlet docker image. Such a image will be tagged as `figlet:<alpine version>`[^1] and `figlet:latest` in some cases{TODO}.

## Minimal installation

Minimal installation installs into the host only the `figlet.sh` given that the image is created either using `build-image.sh` from the source or manually by the user.

These are the steps to follow to do a minimal installation:
- Copy `figlet.sh` file to `/usr/local/bin`.
- Make both `figlet.sh` file executable.  
- From the source directory, runs `./build-image.sh` (ont-time step) to create the figlet docker image. That assumes that `build-image.sh` into the source directoy is executable.

## Do not install at all

figleg can be used directly from the source directory without coping anything into the host. Because of the [figlet architecture and design](#architecture-and-design) before running `figlet.sh` the first time it is needed to create the docker image by running `build-image.sh`.

# Architecture and design

In this chapter are described the internals of figlet.

`figlet.sh` is the script to run to get the banner.  
It runs a temporary docker containter (--rm) starting from figlet:latest docker image.  
So before using the `figlet.sh` script the docker image must be created. It can be created using the `build-image.sh` script (this is a one-time step).
The image build process starts from [^1]alpine:&lt;version&gt; and:
1. Installs figlet.
1. Installs fonts that are available in the `figlet-fonts` directory.

To enable new fonts:
- Put them into the `figlet-fonts` directory.
- Rebuild the image by running the `build-image.sh` script.

Fonts can be downloaded from [figlet-fonts repository](https://github.com/xero/figlet-fonts/tree/master).

# TODO

- Use a configurable location for fonts directory.
- Allow to specify image to use to figlet.sh.
- What about removing build-image.sh and move the image creation in figlet.sh as psql does?

# Credits

- [figlet](http://www.figlet.org/)

