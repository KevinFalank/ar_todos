require_relative 'config/application'
require 'debugger'
require_relative 'app/views/view_todo'
 
class Interface
 
  def self.parse_command(args)
    command = args.shift || ""
 
    case command.downcase
    when "list"
      TaskHeader.new.render(Task.show_tasks)
    when "delete"
      task = Task.delete_task(args[0])
      task ? TaskRemoved.new.render(task) : TaskNotFound.new.render(args[0])
    when "add"
      new_task = Task.add_task(args.join(" "))
      new_task ? TaskAdded.new.render(new_task) : TaskError.new.render(new_task.errors)
    when "complete"
      Task.complete_task(args[0]) ? parse_command(["list"]) : TaskNotFound.new.render(args[0])
    else
      CommandNotKnown.new.render
    end
  end
 
end
 
 
Interface.parse_command(ARGV)

