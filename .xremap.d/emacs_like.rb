window class_not: ['xfce4-terminal', 'Focus-Proxy-Window'] do
  # emacs-like bindings
  remap 'C-b', to: 'Left'
  remap 'C-f', to: 'Right'
  remap 'C-p', to: 'Up'
  remap 'C-n', to: 'Down'

  remap 'M-b', to: 'Ctrl-Left'
  remap 'M-f', to: 'Ctrl-Right'

  remap 'C-a', to: 'Home'
  remap 'C-e', to: 'End'

  remap 'C-k', to: ['Shift-End', 'Ctrl-x']

  remap 'C-h', to: 'BackSpace'
  remap 'C-d', to: 'Delete'
  remap 'M-d', to: 'Ctrl-Delete'

  # actually these are vim insert mode bindings, but compatible with shell
  remap 'C-u', to: ['Shift-Home', 'Ctrl-x']
  remap 'C-w', to: ['Ctrl-Shift-Left', 'Ctrl-x']
end
