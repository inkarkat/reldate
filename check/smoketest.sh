#!/bin/bash

readonly scriptDir="$([ "${BASH_SOURCE[0]}" ] && dirname -- "${BASH_SOURCE[0]}" || exit 3)"
[ -d "$scriptDir" ] || { echo >&2 "ERROR: Cannot determine script directory!"; exit 3; }

"${scriptDir}/../bin/reldate" --help >/dev/null 2>&1
