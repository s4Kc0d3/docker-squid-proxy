# Squid Proxy in Docker

This repository contains the necessary files to build and run a Squid proxy server using Docker. The configuration provided allows for a basic setup that can be customized according to your needs.

## Table of Contents

- [Requirements](#requirements)
- [Files](#files)
- [Setup](#setup)
- [Usage](#usage)
- [Configuration](#configuration)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## Requirements

- Docker
- Docker Compose

## Files

- `Dockerfile`: Defines the Docker image for Squid.
- `docker-compose.yml`: Docker Compose file to set up the Squid service.
- `squid.conf`: Basic Squid configuration file.

## Setup

1. **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/squid-proxy.git
    cd squid-proxy
    ```

2. **Build and run the Docker container**:
    ```bash
    docker-compose up --buid -d
    ```

3. **Check if the container is running**:
    ```bash
    docker ps
    ```

## Usage

Once the container is up and running, Squid will be listening on port `3128`. You can configure your
applications or devices to use this proxy by setting the proxy server to `http://<your-docker-host-ip>:3128`.


## Volumes (optional)

By default, the volumes are commented out prevent permission issues:
    * `./squid/cache`: Directory to store Squid cache.
    * `./squid/logs`: Directory to store Squid logs.

To enable these volumes, uncomment the `volumes` section in the `docker-compose.yml` file. Ensure
the host directories have the correct permissions:

```bash
    mkdir -p squid/cache squid/logs
    sudo chown -R 1000:1000 squid/cache squid/logs
```

## Troubleshooting

If you encounter issues, check the Squid logs located in `./squid/logs` for more information:

```bash
docker-compose logs squid
``` 

You can also verify the health status of the container:

```bash
docker inspect --format='{{json .State.Health}}' squid
```

# Permission Issues

If the container fails due to permission issues with the volumes, ensure that the directories have the
correct ownership and permissions. The Squid process inside the container runs with a specific user
ID (`1000`). Adjust the ownership of the directories accordingly:

```bash
    sudo chown -R 1000:1000 squid/cache squid/logs
```

