def new_file_method
   $win = TkToplevel.new
   $win.title = "New File"
   TkLabel.new($win) do
     text "File Name: "
     width 10
     pack("side"=>"left")
   end
   entry2 = TkEntry.new($win) do
     width 25
     pack("side"=>"left")
   end
   TkButton.new($win) {
      text 'Create'
      command { File.open($active_file.split("/")[$active_file.split("/").length - 2 ] + "/" + entry2.get,"w").close
        $win.destroy
      }
      pack()
   }
end

def new_project_method
   win = TkToplevel.new
   win.title = "New Project"
   TkLabel.new(win) do
     text "Project Type: "
     width 10
     pack()
   end
   v = TkVariable.new(win)

   TkRadioButton.new(win) {
       text 'Console'
       variable v
       value 'Console'
       pack()
    }
   TkRadioButton.new(win) {
       text 'Web'
       variable v
       value 'Web'
       pack()
    }
   entry2 = TkEntry.new(win) do
     width 25
     pack("side"=>"left")
   end
   TkButton.new(win) {
      text 'Browse'
      command { project_path = Tk.chooseDirectory }
      pack("side"=>"left")
   }
   TkButton.new(win) {
      text 'Create'
      command { File.open(entry2.get,"w").close
        $win.destroy
      }
      pack()
   }
end

def save_file_method
  #if(!@open_file.empty?)
      output = File.open($active_file,"w")
      output << $text_code_area.get("1.0", "end")
      output.close
    #end
end

def save_all_method
  #if(!@open_file.empty?)
      output = File.open(label_open_file.text,"w")
      output << text_code_area.get("1.0", "end")
      output.close
    #end
end

def close_project_method
  #if(!@open_file.empty?)
      output = File.open(label_open_file.text,"w")
      output << text_code_area.get("1.0", "end")
      output.close
    #end
end

def run_script_method
  cmd_line = "start cmd.exe /c ruby #{label_open_file.text}"
  system(cmd_line)
end

def debug_script_method
  cmd_line = "start cmd.exe /K ruby #{label_open_file.text}"
  system(cmd_line)
end

def program_information_method
  Tk::messageBox :type => 'ok', :message => $program_information, :icon => 'info', :title => 'Program Information'
end

def program_license_method
  Tk::messageBox :type => 'ok', :message => $license, :icon => 'info', :title => 'Program License'
end

def open_project_method
  project = Tk.chooseDirectory
  $project_name = project.split("/")[project.split("/").length - 1]
  $project_path = project
  directory = get_file_tree(project)

  $program.populate_file_tree(directory)
end

def get_file_tree(file_path, file_tree = [], index = 0)
  if index == 0
    temp = [] << $project_name
    get_file_tree(file_path, temp, index + 1)
    file_tree << temp
  else
    Dir.entries(file_path).each do |f|
      if File.directory?(file_path + "/" + f)
        if f != "." and f != ".."
          temp = [] << f
          get_file_tree(file_path + "/" + f, temp, index + 1)
          file_tree << temp
        end
      else
       file_tree << f
      end
    end
  end
  return file_tree
end

def open_file_method(file_path, text_code_area, label_open_file)
  text_code_area.delete("1.0", "end")
  file = File.open(file_path, "r")
  file.each_line do |line|
    text_code_area.insert 'end', line
  end
  file.close
  $active_file = file_path
  label_open_file.text = file_path.split("/")[file_path.split("/").length - 1]
end

def collapse_method()

end
