# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'gifts/edit', type: :view do
  before(:each) do
    friend = Friend.create!(name: 'Name', birthday: '2022-01-01')
    @gift = assign(:gift, Gift.create!(friend: friend, name: 'Name'))
  end

  it 'renders the edit gift form' do
    render

    assert_select 'form[action=?][method=?]', gift_path(@gift), 'post' do
    end
  end
end
