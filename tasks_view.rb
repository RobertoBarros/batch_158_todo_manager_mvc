class TasksView

  def ask_task_description
    puts "What's the task description?"
    gets.chomp
  end

  def ask_index
    puts "Index?"
    gets.chomp.to_i - 1
  end

  def display(tasks)
    puts "\n"
    puts "-" * 50
    puts "All Tasks:"
    tasks.each_with_index do |task, index|
      done = task.done? ? '[X]' : '[ ]'
      puts "#{index + 1} - #{done} #{task.description}"
    end
    puts "-" * 50
    puts "\n"
  end

end
