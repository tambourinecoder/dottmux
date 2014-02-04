#!/bin/bash

function psSubtree {
  echo `pstree $1 | tr '[:upper:]' '[:lower:]'`
}

function selectPaneByProcessName {
  for paneInfo in `tmux list-panes -F '#{pane_pid}-#{window_index}.#{pane_index}'` ; do
    panePid=`echo $paneInfo | cut -d '-' -f1`
    windowAndPane=`echo $paneInfo | cut -d '-' -f2`

    if [[ `psSubtree $panePid` =~ $1 ]]; then
      tmux select-pane -t $windowAndPane
    fi
  done
}

selectPaneByProcessName $1
