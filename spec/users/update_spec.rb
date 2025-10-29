require './spec_helper'
require './app/notes/index'

RSpec.describe Notes::Index do
  describe '.call' do
    context 'when id is provided' do
      it 'returns matching note' do
        notes = create_list(:note, 25)
        params = { id: notes.first.id }

        result = described_class.(params)

        expect(result).to be_a(Note)
        expect(result.id).to eq(notes.first.id)
        expect(result.title).to eq(notes.first.title)
      end

      it 'raises when not found' do
        expect {
          described_class.call(id: -1)
        }.to raise_error(Sequel::NoMatchingRow)
      end
    end

    context 'when id is not provided' do
      it 'returns all notes' do
        notes = create_list(:note, 25)

        result = described_class.({})

        expect(result).to be_an(Array)
        expect(result.map(&:id)).to match_array(notes.map(&:id))
      end
    end
  end
end
