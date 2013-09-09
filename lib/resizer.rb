require 'active_support/callbacks'


class Resizer
   include ActiveSupport::Callbacks
  
  
  define_callbacks :top, :bottom, :left, :right
  set_callback :top, :before, :make_frame
  set_callback :top, :after, :display_and_focus_window
  set_callback :bottom, :make_frame
  set_callback :bottom, :after, :display_and_focus_window
  set_callback :left, :make_frame
  set_callback :left, :after, :display_and_focus_window
  set_callback :right, :make_frame
  set_callback :right, :after, :display_and_focus_window

  def top(win)
    @win = win
    run_callbacks :top do
      @frame.h /= 2
    end
  end

  def bottom(win)
    @win = win
    run_callbacks :bottom do
      @frame.h /= 2
      @frame.y = @frame.h
    end
  end

  def left(win)
    @win = win
    run_callbacks :left do
      @frame.w /= 2
    end
  end

  def right(win)
    @win = win
    run_callbacks :right do
      @frame.w /= 2
      @frame.x = @frame.w
    end
  end

  def make_frame
    @frame = @win.screen.frame_without_dock_or_menu 
  end

  def display_and_focus_window
    @win.frame = @frame
    @win.focus_window
  end

end