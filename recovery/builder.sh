#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/../scripts/lib/common.sh

load_shflags || exit 1

# lol kefka default im crine
DEFINE_string board "kefka" "Which board to build with" "b"
DEFINE_string output "" "Output file" "o"

FLAGS "$@" || exit 1
ORIGINAL_CMD="$0"
ORIGINAL_PARAMS="$@"
eval set -- "$FLAGS_ARGV"

if [[ "$FLAGS_debug" == "$FLAGS_TRUE" ]]; then
    set -x
fi

echo "recovery board: ${FLAGS_board}"
touch "${FLAGS_output}"
# idk bro do builder logic here i guess