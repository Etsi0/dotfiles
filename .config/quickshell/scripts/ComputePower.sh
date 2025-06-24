#!/bin/bash

top -bn1 | awk '
	/Cpu\(s\)/ { cpu = $2; sub(/%.*/, "", cpu) }
	/Mem :/ {
		gsub(/,/, "", $4); gsub(/,/, "", $6)
		ram = ($6 * 100) / $4
	}
	END { printf "CPU: %s%% | RAM: %.1f%%", cpu, ram }
'