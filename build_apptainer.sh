#!/usr/bin/env bash
# Convert the vscode-tunnel Docker image tar into an Apptainer .sif.
# Run on the Slurm host (or any machine with apptainer installed).
set -euo pipefail

IMAGE=vscode-tunnel
TAR="${IMAGE}.tar"

if [ ! -f "$TAR" ]; then
    echo "Missing ${TAR} - run build_docker.sh first and copy the tar here." >&2
    exit 1
fi

apptainer build "${IMAGE}.sif" "docker-archive://${TAR}"

echo "Built ${IMAGE}.sif"
