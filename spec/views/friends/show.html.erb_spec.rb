require 'rails_helper'

RSpec.describe "friends/show", type: :view do
  before(:each) do
    @friend = assign(:friend, Friend.create!(name: 'Name', birthday: '2022-01-01'))
  end

  it "renders attributes in <p>" do
    render
  end
end
