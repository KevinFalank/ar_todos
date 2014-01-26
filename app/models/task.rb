class Task < ActiveRecord::Base

  validates :name, :presence => true

  def self.show_tasks
    renumber_tasks
    Task.all.to_a
  end

  def self.add_task(task)
    task = Task.new(name: task)
    task.save
    task
  end

  def self.delete_task(displayed_task_id)
    task = find_task(displayed_task_id)
    task.destroy if task
  end

  def self.complete_task(displayed_task_id)
    task = find_task(displayed_task_id)
    if task
      task.completed = 1
      task.save
    else
      false
    end
  end


  protected
  def self.find_task(id)
    begin
      Task.find_by(display_num: id)
    rescue
      false
    end
  end

  def self.renumber_tasks
    # update the display number for all tasks
    all_tasks = Task.all.to_a
    all_tasks.each_with_index { |task, i| 
      task.display_num = i + 1
      task.save
    }
  end
end
