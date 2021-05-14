require_relative 'yesterday_note'

module Utils
  def write_yesterday_note
    yesterday_note = YesterdayNote.new
    puts "Previously task id: "
    yesterday_note.id = gets.chomp
    puts
    puts "#{yesterday_note.id} description: "
    yesterday_note.description = gets.chomp

    yesterday_note
  end

  def prompt(question, choice)
    prompt = TTY::Prompt.new
    note = question

    answer = prompt.select(note, choice)
  end
end
