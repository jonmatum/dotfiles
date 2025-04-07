## iTerm2 Configuration

To command iTerm2 to dispatch text at startup, incorporate the following command into your iTerm2 profile:

```
tmux new-session -d -s HappyHacking -n myWindow;tmux attach -t HappyHacking:myWindow
```
