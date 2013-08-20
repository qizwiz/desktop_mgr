require '/Applications/Zephyros.app/Contents/Resources/libs/zephyros.rb'



# # alert hello world
# API.bind "D", ["Cmd", "Shift"] do
#   API.alert 'hello world'
# end

# wait_on_callbacks

# push to top half of screen
API.bind "K", ["cmd", "alt", "ctrl"] do
  win = API.focused_window
  frame = win.screen.frame_without_dock_or_menu
  hh = frame.h /= 2
  frame.y = win.screen.h - hh
  win.frame = frame
end

wait_on_callbacks