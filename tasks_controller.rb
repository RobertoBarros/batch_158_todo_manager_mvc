require_relative 'task'
require_relative 'tasks_view'

class TasksController
  def initialize(repository)
    @repository = repository
    @view = TasksView.new
  end

  def list
    display_tasks
  end

  def create
    # ask user the task description
    description = @view.ask_task_description
    # instanciate a new task
    task = Task.new(description)
    # add the task to repository
    @repository.add(task)
  end

  def mark_as_done
    # show all tasks to user
    display_tasks
    # ask task index
    index = @view.ask_index
    # find the task in repository by index
    task = @repository.find(index)
    # mark the task as done
    task.mark_as_done!
  end

  def destroy
    # show all tasks to user
    display_tasks
    # ask task index
    index = @view.ask_index
    # remove from repository by index
    @repository.remove(index)
  end

  private

  def display_tasks
    # get all tasks from repository
    tasks = @repository.all
    # send tasks to view
    @view.display(tasks)
  end

end