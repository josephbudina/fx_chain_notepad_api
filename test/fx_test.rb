require './spec_helper'
require 'save_princess_1/bot_saves_princess'

describe 'Bot Saves Princess' do
  it 'should find directions down/left' do
    bot = BotSavesPrincess.new(3, ["---", "-m-", "p--"])

    expect(bot.directions).to eq(["DOWN", "LEFT"])
    expect(bot.move_count).to eq(1)
  end
end
