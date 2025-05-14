require './spec_helper'
require 'controllers/fx_chains_controller'

describe FxChainsController do
  it 'should index fx chain' do
    index = described_class.index

    expect(index).to eq(["DOWN", "LEFT"])
  end
end
