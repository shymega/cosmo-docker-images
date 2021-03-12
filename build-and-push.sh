#!/usr/bin/env bash

# Set Docker user.
DOCKER_USER="${1}"

set -eu

echo "Initialising.."
echo "Docker login ID: ${DOCKER_USER}."

echo "First, let's build the thumbv7em-none-eabihf Rust cross-compiler Docker image."

echo "Changing directory.."
cd $(pwd -P)/CoDirs/
echo "Now building.."
docker build -t "${DOCKER_USER}/rust-cross-custom:thumbv7em-none-eabihf" .

echo "Now let's build the aarch64-unknown-linux-gnu Rust cross-compiler Docker image."

echo "Change directory to aarch64 Linux cross Dockerfile."
cd $(pwd -P)/../cosmo-codi-linuxd

echo "Now building.."
docker build -t "${DOCKER_USER}/rust-cross-custom:aarch64-unknown-linux-gnu" . -f Dockerfile.aarch64-gnu

echo "Now let's build the aarch64-unknown-linux-musl Rust cross-compiler Docker image."

echo "Now building.."
docker build -t "${DOCKER_USER}/rust-cross-custom:aarch64-unknown-linux-musl" . -f Dockerfile.aarch64-musl

exit 0

echo "Pushing images to Docker Hub..."
echo "NOTE: This REQUIRES a Docker Hub account, and credentials, otherwise it WILL NOT work."

echo "Pushing thumbv7em-none-eabif image.."
docker push "${DOCKER_USER}/rust-cross-custom:thumbv7em-none-eabihf"

echo "Pushing aarch64-unknown-linux-gnu image.."
docker push "${DOCKER_USER}/rust-cross-custom:aarch64-unknown-linux-gnu"

echo "Pushing aarch64-unknown-linux-musl image.."
docker push "${DOCKER_USER}/rust-cross-custom:aarch64-unknown-linux-musl"

echo "All done."

exit
