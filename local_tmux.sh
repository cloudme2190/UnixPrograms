#!/bin/bash

sessionname="tmux_local"

cd="cd ~/workbench"
watch="watch -d -n 0.5 "
pane1="$cd; ssh-add ~/.ssh/github_id_rsa; clear"
pane2="ssh osboxes@mydevops.io"
pane3="top"
pane4="cal"

tmux kill-session -t $sessionname

tmux set-option remain-on-exit on

# Pane 1 settings
tmux new-session -d -s $sessionname 
tmux send-keys "$pane1" C-m

# Pane 2 settings
tmux split-window -p 25 -v
tmux send-keys "$pane2" C-m

# Pane 3 settings
tmux split-window -p 25 -h
tmux send-keys "$pane3" C-m

# Pane 4 settings
tmux split-window -p 25 -h
tmux send-keys "$pane4" C-m

tmux -2 attach-session -d -t $sessionname 
