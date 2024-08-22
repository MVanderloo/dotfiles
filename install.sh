#!/usr/bin/env bash

echo "Untested script. Exiting to prevent unintentionally running. Remove when ready to run"
exit 1

# ensure root priviledges
if [ "$(id -u)" -ne 0 ];
	echo 'This script must be run by root' >&2
        exit 1
fi

