#!/bin/bash
# set -x

# List of pvs device
PVS_OUT=$(sudo pvs -o pv_name --noheadings|sed -e 's:^[\ ]*::' -e 's:[1-9].$::'|sort -u)

# List of scsi devices
SCSI_OUT=$(lsscsi |awk '/sd/{print $NF}'|sort)

# Difference between these
comm -3 <(echo "$PVS_OUT") <(echo "$SCSI_OUT")
