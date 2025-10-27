require './spec_helper'
require './app/notes/create'

RSpec.describe Notes::Create do
  describe '.call' do
    it 'persists and returns record' do
      params = {body: "foo", title: "bar"}
      result = described_class.(params)

      expect { described_class.call(params) }
        .to change { Note.count }.by(1)

      note = Note.order(:id).last
      expect(note).to be_a(Note)
      expect(note.id).not_to be_nil
      expect(note).to have_attributes(title: params[:title], body: params[:body])
    end

    it 'returns the created instance' do
      params = { title: 'title', body: 'body' }
      note = described_class.call(params)

      expect(note).to have_attributes(params)
    end
  end
end
