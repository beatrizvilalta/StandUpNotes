# frozen_string_literal: true

require 'pry'
require_relative 'header'
require_relative 'standup_note'
require_relative 'utils'

include Utils

header = Header.new
stand_up_note = StandUpNote.new

stand_up_note.date = header.choose_date
yesterday = Utils.write_yesterday_note
yesterday_list = []
yesterday_list.push(yesterday)

choices = %w[Yes No]
question = 'Do you want to register more tasks? '
answer = Utils.prompt(question, choices)

while answer == choices[0]
  another_yesterday_note = write_yesterday_note
  yesterday_list.push(another_yesterday_note)
  answer = Utils.prompt(question, choices)
end

stand_up_note.yesterday_tasks_list = yesterday_list

binding.pry

