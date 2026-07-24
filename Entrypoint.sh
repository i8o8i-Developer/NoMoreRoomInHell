#!/bin/bash
set -e
INSTALL_DIR=/home/steam/nmrih

echo "=== Installing / Udating No More Room In Hell Dedicated Server ==="
steamcmd +force_install_dir "$INSTALL_DIR" \
  +login anonymous \
  +app_update 317670 validate \
  +quit

cd "$INSTALL_DIR"

HOSTNAME_TITLE=$(echo "${SRCDS_HOSTNAME:-NMRIH Durgaai Solutions}" | \
  awk '{for(i=1;i<=NF;i++){$i=toupper(substr($i,1,1)) substr($i,2)}}1')

echo "=== Starting Server : $HOSTNAME_TITLE ==="

exec ./srcds_run \
  -game nmrih \
  -console \
  -usercon \
  -ip 176.31.163.114 \
  -port ${SRCDS_PORT:-27015} \
  +map ${SRCDS_MAP:-nmo_broadway} \
  +maxplayers ${SRCDS_MAXPLAYERS:-8} \
  +hostname "$HOSTNAME_TITLE" \
  +rcon_password "${RCON_PASSWORD:-ChangeMe}" \
  +sv_password "${SERVER_PASSWORD:-}" \
  +sv_setsteamaccount "${GSLT_TOKEN}"
