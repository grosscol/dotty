#!/usr/bin/env bash

SESS_NAME="ui"
CODE_WNDW="CODING_UI"

# Path to project directory
PROJ_DIR="/home/yerusername/workspace/helloworld"

# Hack used when trying to include shell command with split-window directly
# Just use send-keys instead.
#   start an interactive shell and immediately activate conda environment
#   INIT_CMD="bash --rcfile <(echo '. ~/.bashrc; conda activate ${CONDA_ENV}');"

# start watching the existing js and vue files, and run test suite when changed
UI_WATCH_CMD="fd '\.(js|Vue|vue)$' . | entr -c npm run test:unit"
UI_SETUP_CMD="tree src"


# Set title of terminal window. See .bashrc for retitle definition
retitle "tmux-code"

tmux new-session -d -c "${PROJ_DIR}" -s "${SESS_NAME}" -n "${CODE_WNDW}"
tmux split-window -v -c "${PROJ_DIR}" -l 25

tmux send-keys -t "${SESS_NAME}:${CODE_WNDW}.0" "${UI_WATCH_CMD}" Enter
tmux send-keys -t "${SESS_NAME}:${CODE_WNDW}.1" "${UI_SETUP_CMD}" Enter

tmux attach-session -d -t "${SESS_NAME}"
