# frozen_string_literal: true

class StandUpNote
  attr_accessor :date, :yesterday_tasks_list, :next_tasks_list, :blocks_list

  def to_string
    puts "StandUp note for #{date}"
    puts '—'
    puts 'Previous tasks: '
    show_tasks(yesterday_tasks_list)
    puts
    puts 'Next tasks: '
    show_tasks(next_tasks_list)
    puts
    puts 'Blocks: '
    puts show_blocks
  end

  def are_there_no_blocks
    blocks_list.nil?
  end

  def show_blocks
    quote = ''
    if are_there_no_blocks
      quote = 'No blocks'
    else
      blocks_list.each do |current_block|
        quote = "> #{current_block.description}"
      end
    end
    quote
  end

  def show_tasks(list)
    list.each do |current_task|
      puts "> #{current_task.id}: #{current_task.description}"
    end
  end

end
