#!/bin/bash

set -x

# === EDIT THESE ===
REMOTE_USER="root"                  # or your VPS user
REMOTE_HOST="74.208.73.242"         # your VPS public IP
REMOTE_PORT="8096"
LOCAL_PORT="80"
SSH_KEY="/home/tim/.ssh/id_ed25519"
SSH_PORT="22"                       # change if you use a non-standard port
# ==================

# Clean any old process using the remote port
ssh -p "$SSH_PORT" "$REMOTE_USER@$REMOTE_HOST" \
    "lsof -i :$REMOTE_PORT -t | xargs -r kill -9" 2>/dev/null

echo "Starting tunnel $HOSTNAME → $REMOTE_HOST"

exec ssh -o StrictHostKeyChecking=no \
     -o ServerAliveInterval=30 \
     -o ServerAliveCountMax=3 \
     -o ExitOnForwardFailure=yes \
     -o GatewayPorts=yes \
     -N -T \
     -i "$SSH_KEY" \
     -p "$SSH_PORT" \
     -R "$REMOTE_PORT:localhost:$LOCAL_PORT" \
     "$REMOTE_USER@$REMOTE_HOST"
