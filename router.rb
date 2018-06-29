class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      print_actions
      action = gets.chomp.to_i
      dispatch(action)
    end
  end

  private

  def print_actions
    puts "-" * 50
    puts "Select what you want:"
    puts "1 - Add a new task"
    puts "2 - List all tasks"
    puts "3 - Mark a task as done"
    puts "4 - Remove a task"
    puts "-" * 50
  end

  def dispatch(action)
    case action
    when 1 then @controller.create
    when 2 then @controller.list
    when 3 then @controller.mark_as_done
    when 4 then @controller.destroy
    else
      puts "Please type 1, 2, 3, 4"
    end
  end

end