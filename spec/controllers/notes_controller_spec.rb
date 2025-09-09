require './spec_helper'
require './app/controllers/notes_controller'

describe NotesController do
  it 'should index fx chain' do
    result = described_class.new
    binding.pry
    expect(result.index).to eq(["DOWN", "LEFT"])
  end
end
