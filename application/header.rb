# frozen_string_literal: true

require 'tty-prompt'
require 'date'
require 'pry'

# this class shows the header view content
class Header

  def type_date
    puts 'What date is the note for? '
    date = gets.chomp

    begin
      date = Date.parse(date)
      date.strftime('%b %d')
    rescue Date::Error => e
      puts 'Invalid date format!'
      puts
      type_date
    end
  end

  def format_today_date
    date = DateTime.now
    date.strftime('%b %d')
  end

  def choose_date
    prompt = TTY::Prompt.new
    note =  'Is the note for today?'

    choices = %w[Yes No]

    answer = prompt.select(note, choices)

    if answer == choices[0]
      format_today_date
    elsif answer == choices[1]
      type_date
    end
  end
end
