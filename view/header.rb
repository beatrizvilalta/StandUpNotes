# frozen_string_literal: true

require 'tty-prompt'
require 'date'
require 'pry'

# this class shows the header view content
class HeaderView
  def self.choose_date
    prompt = TTY::Prompt.new
    note =  'Is the note for today?'

    choices = %w[Yes No]

    answer = prompt.select(note, choices)

    if answer == choices[0]
      date = DateTime.now
      date.strftime('%b %d')
    elsif answer == choices[1]
      puts 'What date is the note for? '
      date = gets.chomp

      begin
        date = Date.parse(date)
        date.strftime('%b %d')
      rescue Date::Error => e
        message = 'Invalid date format'
        puts message
        message
      end

    end
  end
end
