require 'rails_helper'

RSpec.describe "friends/index", type: :view do
  before(:each) do
    assign(:friends, [
      Friend.create!(name: 'Name', birthday: '2022-01-01'),
      Friend.create!(name: 'Name', birthday: '2022-01-01')
    ])
  end

  it "renders a list of friends" do
    render
  end
end
