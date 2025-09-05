require './spec_helper'
require './app/controllers/notes_controller'

describe NotesController do
  it 'should index fx chain' do
    index = described_class.index

    expect(index).to eq(["DOWN", "LEFT"])
  end
end
