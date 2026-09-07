#!/usr/bin/env bash
# Build the vscode-tunnel Docker image and save it as a tar for transfer to the Slurm host.
set -euo pipefail

IMAGE=vscode-tunnel
TAG=latest
ARCH=${1:-x64}
# pass arm64 as $1 if the Slurm host is aarch64

docker build --build-arg VSCODE_CLI_ARCH="$ARCH" -t "${IMAGE}:${TAG}" .
docker save "${IMAGE}:${TAG}" -o "${IMAGE}.tar"

echo "Built ${IMAGE}.tar - copy it to the Slurm host and run build_apptainer.sh there."
