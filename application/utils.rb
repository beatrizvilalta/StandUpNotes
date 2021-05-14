require_relative 'yesterday_note'
require_relative 'next_notes'
require_relative 'blocks'

module Utils
  def write_yesterday_note
    yesterday_note = YesterdayNote.new
    puts 'Previous task id: '
    yesterday_note.id = gets.chomp
    puts
    puts 'Description: '
    yesterday_note.description = gets.chomp

    yesterday_note
  end

  def prompt(question, choice)
    prompt = TTY::Prompt.new
    note = question

    prompt.select(note, choice)
  end

  def write_next_note
    next_notes = NextNotes.new
    puts 'Next task id: '
    next_notes.id = gets.chomp
    puts
    puts 'Description: '
    next_notes.description = gets.chomp

    next_notes
  end

  def write_blocks
    blocks = Blocks.new
    puts 'Describe your blocks: '
    blocks.description = gets.chomp

    blocks
  end

  def check_more_tasks(choices)
    question = 'Do you want to register another thing? '
    Utils.prompt(question, choices)
  end
end
