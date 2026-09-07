#!/bin/bash
#SBATCH --job-name=code-tunnel
#SBATCH --output=code-tunnel-%j.log
#SBATCH --time=08:00:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G

# Apptainer auto-mounts $HOME by default, so tunnel auth (device login,
# stored under ~/.vscode-cli) persists across separate job submissions.
apptainer exec vscode-tunnel.sif code tunnel \
    --accept-server-license-terms \
    --name "${SLURM_JOB_ID}"

# First run: watch the log for the device-login URL/code and authenticate
# in a browser (GitHub or Microsoft account). Subsequent jobs reuse that
# login automatically as long as $HOME is unchanged.
