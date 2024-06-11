# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'friends/edit', type: :view do
  before(:each) do
    @friend = assign(:friend, Friend.create!(name: 'Name', birthday: '2022-01-01'))
  end

  it 'renders the edit friend form' do
    render

    assert_select 'form[action=?][method=?]', friend_path(@friend), 'post' do
    end
  end
end
