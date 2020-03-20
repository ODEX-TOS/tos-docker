[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/ODEX-TOS/tos-docker">
    <img src="https://tos.odex.be/images/logo.svg" alt="Logo" width="150" height="200">
  </a>

  <h3 align="center">Docker image for tos</h3>

  <p align="center">
    Simple docker images for TOS
    <br />
    <a href="https://github.com/ODEX-TOS/tos-docker"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/ODEX-TOS/tos-docker">View Demo</a>
    ·
    <a href="https://github.com/ODEX-TOS/tos-docker/issues">Report Bug</a>
    ·
    <a href="https://github.com/ODEX-TOS/tos-docker/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [About the Project](#about-the-project)
  - [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)
- [Acknowledgements](#acknowledgements)

<!-- ABOUT THE PROJECT -->

## About The Project

This repository contains 2 docker images that you can build on your own.

- `Dockerfile` contains the most basic docker image (archlinux image with tos repository)
- `Dockerfile.user` contains a full tos image together with a build in user (includes things such as yay)

<!-- GETTING STARTED -->

## Getting Started

### Prerequisites

All you need is docker
You can also use `make` to make your life a bit easier.

### Installation

1. Clone the tos-docker

```sh
git clone https://github.com/ODEX-TOS/tos-docker.git
```

2. Install docker

```sh
pacman -Syu docker
```

3. Enable docker

```sh
systemctl start docker && systemctl enable docker
```

<!-- USAGE EXAMPLES -->

## Usage

### Use our image

```sh
docker pull f0xedb/tos:latest
docker pull f0xedb/tos-user:latest
```

### Build your own image

> Everything below will be explained using `make` and a `Makefile` if you wish to run the commands yourself look into the `Makefile`

### Build the docker containers

```sh
# to build Dockerfile
make build
# to build Dockerfile.user
make build-user
```

### build and upload image

```sh
# Dockerfile
make all-tos
# Dockerfile-user
make all-user
```

> By default the docker images are called `tos` and `tos-user`
> And also upload by default go to `f0xedb/tos:latest`

### Override variabled

If you wish to rename the image or upload to a different docker user do the following

```sh
DOCKER_USER="f0xedb" IMAGE_NAME="tos-base" IMAGE_NAME_USER="tos" make all
```

`DOCKER_USER` is an env variable that holds the user to upload the images to

`IMAGE_NAME` is an env variable that holds the image name for the Dockerfile

`IMAGE_NAME_USER` is the same as `IMAGE_NAME` but for Dockerfile.user

### Cleanup the docker build files/images

```sh
make clean
```

### Run the docker container locally

```sh
make run
make run-user
```

_For more examples, please refer to the [Documentation](https://github.com/ODEX-TOS/tos-docker)_

<!-- ROADMAP -->

## Roadmap

See the [open issues](https://github.com/ODEX-TOS/tos-docker/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- CONTACT -->

## Contact

F0xedb - tom@odex.be

Project Link: [https://github.com/ODEX-TOS/tos-docker](https://github.com/ODEX-TOS/tos-docker)

<!-- ACKNOWLEDGEMENTS -->

## Acknowledgements

- [ODEX-TOS](https://github.com/ODEX-TOS/tos-docker)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/ODEX-TOS/tos-docker.svg?style=flat-square
[contributors-url]: https://github.com/ODEX-TOS/tos-docker/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ODEX-TOS/tos-docker.svg?style=flat-square
[forks-url]: https://github.com/ODEX-TOS/tos-docker/network/members
[stars-shield]: https://img.shields.io/github/stars/ODEX-TOS/tos-docker.svg?style=flat-square
[stars-url]: https://github.com/ODEX-TOS/tos-docker/stargazers
[issues-shield]: https://img.shields.io/github/issues/ODEX-TOS/tos-docker.svg?style=flat-square
[issues-url]: https://github.com/ODEX-TOS/tos-docker/issues
[license-shield]: https://img.shields.io/github/license/ODEX-TOS/tos-docker.svg?style=flat-square
[license-url]: https://github.com/ODEX-TOS/tos-docker/blob/master/LICENSE.txt
[product-screenshot]: https://tos.odex.be/images/logo.svg
