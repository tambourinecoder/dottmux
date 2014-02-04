#!/bin/bash

currentPane=`tmux display-message -p '#P'`
tmuxCommand="\"tmux swap-pane -s $currentPane -t %%\""
prompt="swap with: "

tmux display-panes
tmux command-prompt -p "$prompt" "run $tmuxCommand"
