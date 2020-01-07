class Menu_Builder
  def add(root)
      @root = root
  end

  def build_menus
    self.build_file_menu
    self.build_help_menu
    self.build_build_menu
    menu_bar = TkMenu.new
    menu_bar.add('cascade',
                 'menu'  => @file_menu,
                 'label' => "File",
                 'underline' => 1)
    menu_bar.add('cascade',
                'menu'  => @build_menu,
                'label' => "Build")
    menu_bar.add('cascade',
                'menu'  => @help_menu,
                'label' => "Help")
    @root.menu(menu_bar)
  end

  def build_file_menu
    @file_menu = TkMenu.new(@root)

    @file_menu.add('command',
                  'label'     => "New Project",
                  'command'   => Proc.new {new_project_method},
                  'underline' => 0)
    @file_menu.add('command',
                  'label'     => "New File",
                  'command'   => Proc.new {new_file_method},
                  'underline' => 0)
    @file_menu.add('command',
                  'label'     => "Open Project",
                  'command'   => Proc.new {open_project_method},
                  'underline' => 0)
    @file_menu.add('command',
                  'label'     => "Close Project",
                  'command'   => Proc.new {close_project_method},
                  'underline' => 0)
    @file_menu.add('separator')
    @file_menu.add('command',
                  'label'     => "Save",
                  'command'   => Proc.new {save_file_method},
                  'underline' => 0)
    @file_menu.add('command',
                  'label'     => "Save All",
                  'command'   => Proc.new {save_all_method},
                  'underline' => 5)
    @file_menu.add('separator')
    @file_menu.add('command',
                  'label'     => "Exit",
                  'command'   => Proc.new {exit},
                  'underline' => 3)
  end

  def build_build_menu
    @build_menu = TkMenu.new(@root)

    @build_menu.add('command',
                  'label'     => "Run",
                  'command'   => Proc.new {run_script_method},
                  'underline' => 0)
    @build_menu.add('command',
                  'label'     => "Debug",
                  'command'   => Proc.new {debug_script_method},
                  'underline' => 0)
  end

  def build_help_menu
    @help_menu = TkMenu.new(@root)

    @help_menu.add('command',
                  'label'     => "Program Information",
                  'command'   => Proc.new {program_information_method},
                  'underline' => 0)
    @help_menu.add('command',
                  'label'     => "Program License",
                  'command'   => Proc.new {program_license_method},
                  'underline' => 0)
  end
end
