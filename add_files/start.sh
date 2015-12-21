#!/bin/bash

subcmd="${1}"
script_dir="/scripts"

## start smbd
[ "${subcmd}" = "smbd" ] \
    && { /usr/sbin/smbd -F; exit $?; }

## exec subcommand
cmd="${script_dir}/${subcmd}.sh"
[ -x "${cmd}" ] \
    && { "${cmd}" "${@:2}"; exit $?; }

## display usage
cat <<_USAGE
Usage:
    Please set subcommand.

    subcommands:
        smbd ... start smbd daemon after setup
$(
        for file in $(find ${script_dir} -maxdepth 1 -type f -executable -not -name '.*')
        do
            name=$(basename "${file}" | sed -e 's/\.sh$//')
cat <<EOS
        ${name} ... $(sed -ne '/^# *@(#)/{ s/^# *@(#) *//; p }' ${file})
EOS
        done
)
_USAGE
