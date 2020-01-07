# Required ruby code
require 'tk'
require "#{$root_directory}/app/view/frame_builder.rb"
require "#{$root_directory}/app/view/menu_builder.rb"
require "#{$root_directory}/lib/command_methods.rb"

class Application_Builder
  def initialize
    # Building the main application
    root = TkRoot.new
    root.title = $application_name
    root.minsize(1000,700)
    #image = TkPhotoImage.new
    #image.file = "#{$root_directory}/app/assets/image/92034.png"
    #root.iconphoto(myicon)

    # Menu
    menu = Menu_Builder.new
    menu.add(root)
    menu.build_menus

    # Frame
    @frames = Frame_Builder.new
    @frames.add(root)
    @frames.build_frames
  end

  def start
    Tk.mainloop
  end

  def populate_file_tree(directory)
    @frames.populate_file_tree(directory)
  end
end
