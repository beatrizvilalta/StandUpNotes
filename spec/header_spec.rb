# frozen_string_literal: true

require 'date'
require 'spec_helper'
require_relative '../view/header'

describe HeaderView do
  describe '.choose_date' do
    let(:prompt) { double }
    let(:result) { described_class.choose_date }

    before do
      allow(TTY::Prompt).to receive(:new).and_return(prompt)
      allow(prompt).to receive(:select).and_return(answer)
      set_up_action
      result
    end

    context 'when choose Yes' do
      let(:answer) { 'Yes' }
      let(:set_up_action) {}

      it 'should return todays date' do
        expected_result = DateTime.now.strftime('%b %d')

        note = 'Is the note for today?'
        choices = %w[Yes No]

        expect(prompt).to have_received(:select).with(note, choices)
        expect(result).to eql(expected_result)
      end
    end

    context 'when choose No' do
      let(:answer) { 'No' }

      context 'when enters a valid date' do
        let(:set_up_action) { allow(described_class).to receive(:gets).and_return('April 1') }

        it 'should return the chosen date formatted' do
          expected_result = 'Apr 01'

          note = 'Is the note for today?'
          choices = %w[Yes No]

          expect(prompt).to have_received(:select).with(note, choices)
          expect(result).to eql(expected_result)
        end
      end

      context 'when enteres an invalid date' do
        context 'and enter a string that cant be converted to date' do
          let(:set_up_action) { allow(described_class).to receive(:gets).and_return('oi') }

          it 'should return an error message' do
            expected_error_message = 'Invalid date format'
            expect(result).to eql(expected_error_message)
          end
        end

        context 'and click enter without typing a date' do
          let(:set_up_action) { allow(described_class).to receive(:gets).and_return('') }

          it 'should return an error message' do
            expected_error_message = 'Invalid date format'
            expect(result).to eql(expected_error_message)
          end
        end
      end
    end
  end
end
