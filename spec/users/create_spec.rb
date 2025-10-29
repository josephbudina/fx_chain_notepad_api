require './spec_helper'
require './app/users/create'

RSpec.describe Users::Create do
  describe '.call' do
    it 'persists and returns record' do
      params = {
                email: 'foo@bar.com',
                name: 'John Foo',
                password_digest: 'passfoo',
                avatar_url: 'newfoo'
               }

      expect { described_class.call(params) }
        .to change { User.count }.by(1)

      user = User.order(:id).last
      expect(user).to be_a(User)
      expect(user.id).not_to be_nil
      expect(user).to have_attributes(name: params[:name], email: params[:email])
    end

    it 'returns the created instance' do
      params = {
                email: 'foo@bar.com',
                name: 'John Foo',
                password_digest: 'passfoo',
                avatar_url: 'newfoo'
               }
      user = described_class.call(params)

      expect(user).to have_attributes(params)
    end
  end
end
