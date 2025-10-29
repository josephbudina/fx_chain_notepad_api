require './spec_helper'
require './app/users/index'

RSpec.describe Users::Index do
  describe '.call' do
    context 'when id is provided' do
      it 'returns matching user' do
        users = create_list(:user, 25)
        params = { id: users.first.id }

        result = described_class.(params)

        expect(result).to be_a(User)
        expect(result.id).to eq(users.first.id)
        expect(result.email).to eq(users.first.email)
      end

      it 'raises when not found' do
        expect {
          described_class.call(id: -1)
        }.to raise_error(Sequel::NoMatchingRow)
      end
    end

    context 'when id is not provided' do
      it 'returns all users' do
        users = create_list(:user, 25)

        result = described_class.({})

        expect(result).to be_an(Array)
        expect(result.map(&:id)).to match_array(users.map(&:id))
      end
    end
  end
end
