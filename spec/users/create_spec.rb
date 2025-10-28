require './spec_helper'
require './app/users/create'

RSpec.describe Users::Create do
  describe '.call' do
    it 'persists and returns record' do
      params = {body: "foo", title: "bar"}
      result = described_class.(params)

      expect { described_class.call(params) }
        .to change { User.count }.by(1)

      user = User.order(:id).last
      expect(user).to be_a(User)
      expect(user.id).not_to be_nil
      expect(user).to have_attributes(title: params[:title], body: params[:body])
    end

    it 'returns the created instance' do
      params = { title: 'title', body: 'body' }
      user = described_class.call(params)

      expect(user).to have_attributes(params)
    end
  end
end
