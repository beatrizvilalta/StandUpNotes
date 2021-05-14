# frozen_string_literal: true

require 'pry'
require_relative 'header'
require_relative 'standup_note'
require_relative 'utils'
require_relative 'screen'

include Utils
include Screen

header = Header.new

stand_up_note = StandUpNote.new
stand_up_note.date = header.choose_date
puts

#Previous notes
yesterday = Utils.write_yesterday_note
yesterday_list = []
yesterday_list.push(yesterday)

puts
choices = %w[Yes No]
answer = Utils.check_more_tasks(choices)

while answer == choices[0]
  puts
  another_yesterday_note = write_yesterday_note
  yesterday_list.push(another_yesterday_note)
  puts
  answer = Utils.check_more_tasks(choices)
end

stand_up_note.yesterday_tasks_list = yesterday_list

# Today notes

puts
next_task = Utils.write_next_note
next_list = []
next_list.push(next_task)

puts
answer = Utils.check_more_tasks(choices)

while answer == choices[0]
  puts
  another_next_note = write_next_note
  next_list.push(another_next_note)
  puts
  answer = Utils.check_more_tasks(choices)
end

stand_up_note.next_tasks_list = next_list

# Blocks
puts
question = 'Do you have any blocks? '
answer = Utils.prompt(question, choices)

block_list = []
while answer == choices[0]
  puts
  another_block_note = write_blocks
  block_list.push(another_block_note)
  puts
  answer = Utils.check_more_tasks(choices)
end
stand_up_note.blocks_list = block_list


Screen.clear
stand_up_note.to_string

