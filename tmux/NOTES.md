# How to execute a command by default starting tmux

```
#!/bin/bash
tmux new-session -d -s mySession -n myWindow
tmux send-keys -t mySession:myWindow "cd /my/directory" Enter
tmux send-keys -t mySession:myWindow "vim" Enter
tmux attach -t mySession:myWindow
```
