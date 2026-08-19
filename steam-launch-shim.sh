#!/bin/bash
# Takes Steam launch commands and returns them back modified
#
# When launching SDK, also applies editor fixes before returning the command.
#
# Required for launching the development version of the game and SDK 
# on Linux from a terminal or via IDE.
#
# USAGE
#     Add this line to `Darkest Hour: Europe '44-'45` and `RedOrchestra SDK Beta`
#     Launch Options in Steam Library:
#
#         eval $(./steam-launch-shim.sh -c "%command%")
#
#     When running the game via a command line, any exe 
#     arguments passed after `--` will override the defaults.
#     
#     Running the game via Steam Library will launch the release version.
#
# COMMAND LINE OPTIONS
#     Passed to Steam command (can precede `--`)
#
#     --multi         launch 2 clients
#
# SHIM OPTIONS
#     Passed to shim script in Launch Options
#
#     -c, --command   Steam launch command ("%command%").
#     -v, --verbose   show debugging messages
#     -D, --dry       don't return anything (use with -v for debugging)
#
# EXAMPLES
#     Launch dev client on Rederitz Advance:
#     $ steam -applaunch 1280 -- DH-Rederitz_Advance.rom?quickstart=true
#
#     Launch release client (shim does nothing):
#     $ steam -applaunch 1280
#
#     Launch 2 dev clients and connect to local server:
#     $ steam -applaunch 1280 -- 127.0.0.1 -mod=DarkestHourDev --multi
#
#     Launch dev editor
#     $ steam -applaunch 1220 -- -mod=DarkestHourDev -nogamma
#

EXE_CLIENT="RedOrchestraLargeAddressAware.exe"
EXE_CLIENT_COPY="${EXE_CLIENT/.exe/_0.exe}"
EXE_SDK="ROEd.exe"
EXE_SDK_LAA="ROEdLAA.exe"

IS_VERBOSE=
IS_DRY_RUN=
COMMAND_RECEIVED=
COMMAND_NEW=

# Parse shim arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -c|--command)
	        COMMAND_RECEIVED="$2"
	        shift; shift;;
        -D|--dry)
            IS_DRY_RUN=1
            shift;;
        -v|--verbose)
            IS_VERBOSE=1
            shift;;
    esac
done

# Strip all shim options from the launch command
strip_shim_opts () {
	sed -re "s/ ?'?--(multi|editor)'?//g" 2>/dev/null </dev/stdin
}

# Get an unmodified launch command for the app
get_default_command () {
    sed -re "s/(($EXE_CLIENT|$EXE_SDK)'?.*) '?--'?( .*|$)/\1/" 2>/dev/null <<<"$COMMAND_RECEIVED" \
	| strip_shim_opts
}

# Get a command for just the executable with all arguments stripped
get_base_command () {
    sed -re "s/($EXE_CLIENT|$EXE_SDK)('?).*/\1\2/" 2>/dev/null <<<"$COMMAND_RECEIVED"
}

# Get new exe options
get_exe_opts () {
	sed -re "s/ '?--'?( |$)(.*)/\2/" 2>/dev/null <<<"${COMMAND_RECEIVED/$(get_default_command)/}" \
	| strip_shim_opts
}

NEW_EXE_OPTS=$(get_exe_opts)

if [[ -z "$NEW_EXE_OPTS" ]]; then
    COMMAND_NEW="$(get_default_command)"
else
    COMMAND_NEW="$(get_base_command) $NEW_EXE_OPTS"
fi

if [[ "$COMMAND_RECEIVED" == *"--multi"* ]]; then
	# Create exe for the second client
	cp -up System/$EXE_CLIENT System/$EXE_CLIENT_COPY   # create a second exe
    COMMAND_NEW="${COMMAND_NEW//waitforexitandrun/run}" # allow multiple clients
    COMMAND_NEW="$COMMAND_NEW & ${COMMAND_NEW/$EXE_CLIENT/$EXE_CLIENT_COPY}"
elif [[ "$COMMAND_RECEIVED" == *"$EXE_SDK"* ]]; then
	# Apply SDK fixes
	python tools/scripts/clear-windowpositions.py DarkestHourDev/System/DarkestHourDevUser.ini # fix windows positions
    cp -rf System/EditorSelectionFix/D3DDrv.dll System/ # fix click delay
	COMMAND_NEW="${COMMAND_NEW/$EXE_SDK/$EXE_SDK_LAA}"  # use LAA
fi

# Finally, return the command for Steam to consume
if [[ -z $IS_DRY_RUN ]]; then
	echo "$COMMAND_NEW"
fi

if [[ -n $IS_VERBOSE ]]; then
  cat >&2 <<EOF
==== SHIM DEBUG ====
IS_DRY_RUN=$IS_DRY_RUN

Received command:
"$COMMAND_RECEIVED"

Default command:
"$(get_default_command)"

Base command:
"$(get_base_command)"

New exe options:
"$NEW_EXE_OPTS"

New command:
"$COMMAND_NEW"

====================
EOF
fi