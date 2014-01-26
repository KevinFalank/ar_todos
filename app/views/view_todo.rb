class TaskHeader
  def render(tasks)
    tasks.each { |task| 
      puts "#{task.display_num}. [#{"X" if task.completed}] #{task.name}"
    }
  end
end
 
class TaskRemoved
 
  def render(task)
    #debugger
    puts <<-STRING
 
**************************************************
Deleted #{task.name} from your TODO list...
**************************************************
 
STRING
  end
end
 
 
class TaskAdded
  def render(task)
    puts <<-STRING
 
*************************************************
Appended #{task.name} to your TODO list...
*************************************************
 
STRING
  end
end
 
class CommandNotKnown
  def render
    puts "That commond is not recognized."
  end
end
 
class TaskNotFound
  def render(task_id)
    puts "The selected task (/#{task_id}/) cannot be found."
  end
end

class TaskError
  def render(errors)
    puts "we seem to have a problem: #{errors.full_messages}"
  end
end