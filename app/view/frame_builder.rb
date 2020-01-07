class Frame_Builder
  def add(root)
      @root = root
  end

  def build_frames
    self.build_toolbar
    self.build_main
    self.build_status
  end

  def build_toolbar
    frame_toolbar = TkFrame.new(@root) {
      background "#2a3439"
      highlightbackground "black"
      pack('fill'=>'x', 'anchor' => 'n', 'side' => 'top')
    }

    # Buttons
    button_open = TkButton.new(frame_toolbar) do
      text "open"
      background "#2a3439"
      foreground "white"
      activebackground 'black'
      borderwidth 0
      command {open_project_method}
      pack("side"=>"left")
    end

    button_new = TkButton.new(frame_toolbar) do
      text "new"
      background "#2a3439"
      foreground "white"
      activebackground 'black'
      borderwidth 0
      command {new_file_method}
      pack("side"=>"left")
    end

    button_save = TkButton.new(frame_toolbar) do
      text "save"
      background "#2a3439"
      foreground "white"
      activebackground 'black'
      borderwidth 0
      command {save_file_method}
      pack("side"=>"left")
    end
    button_debug = TkButton.new(frame_toolbar) do
      text "debug"
      background "#2a3439"
      foreground "white"
      activebackground 'black'
      borderwidth 0
      command {debug_script_method}
      pack("side"=>"left")
    end
    button_build = TkButton.new(frame_toolbar) do
      text "run"
      background "#2a3439"
      foreground "white"
      activebackground 'black'
      borderwidth 0
      command {run_script_method}
      pack("side"=>"left")
    end
  end

  def build_main
    frame_main = TkFrame.new(@root) {
      relief 'sunken'
      borderwidth 1
      pack('fill'=>'both', 'expand'=>'1', 'anchor' => 'ne')
    }

    @frame_file_tree = TkFrame.new(frame_main) {
      width 20
      background "#2a3439"
      pack('fill'=>'y', 'side'=>'left')
    }

    frame_code_window = TkFrame.new(frame_main) {
      background "#353839"
      pack('fill'=>'both', 'side'=>'right', 'expand'=>'1')
    }

    # Label
    @label_open_file = TkLabel.new(frame_code_window) do
      height(1)
      pack()
      background "#353839"
      foreground "white"
    end

    label_project = TkLabel.new(@frame_file_tree) do
      text "Project"
      width 20
      height(1)
      background "#2a3439"
      foreground "white"
      pack()
    end

    # Text Field
    $text_code_area = TkText.new(frame_code_window) do
      background "#353839"
      foreground "white"
      pack('fill'=>'both', 'expand'=>'1')
    end
  end

  def build_status
    frame_status_bar = TkFrame.new(@root) {
      background "#2a3439"
      relief 'sunken'
      borderwidth 2
      highlightbackground "black"
      pack('fill'=>'x', 'anchor' => 's')
    }

    label_version = TkLabel.new(frame_status_bar) do
      background "#2a3439"
      foreground "white"
      text "Version: #{$software_version}"
      pack("side"=>"left")
    end

    label_status = TkLabel.new(frame_status_bar) do
      background "#2a3439"
      foreground "white"
      text "Status: Green"
      pack("side"=>"right")
    end
  end

  def populate_file_tree(directory)
    canvas = TkCanvas.new(@frame_file_tree) do
      background "#2a3439"
      pack('fill'=>'both')
    end
    fill_file_tree(canvas, directory)
  end

  def fill_file_tree(object, directory, file_path = $project_path, space = 0)
    directory.each do |d|
      if(d.respond_to?("flatten"))
        text = TkText.new(object) do
          height(1)
          width "17"
          background "#2a3439"
          foreground "white"
          borderwidth 0
          pack()
        end
        text.insert "1.0", "► #{d[0]}".prepend("".rjust(space))
        text.tag_add("<Button-1>", "1.0", "end")
        text.tag_bind("<Button-1>", "1", proc{})
        space == 0 ? fill_file_tree(object, d.drop(1), file_path, space + 1) : fill_file_tree(object, d.drop(1), file_path + "/" + d[0], space + 1)
      else
        text = TkText.new(object) do
          height(1)
          width "17"
          background "#2a3439"
          foreground "white"
          borderwidth 0
          pack()
        end
        text.insert "1.0", "#{d}".prepend("".rjust(space))
        text.tag_add("<Button-1>", "1.0", "end")
        text.tag_bind("<Button-1>", "1", proc{open_file_method(file_path + "/" + d, $text_code_area, @label_open_file)})
      end
    end
  end
end
