# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'gifts/show', type: :view do
  before(:each) do
    friend = Friend.create!(name: 'Name', birthday: '2022-01-01')
    @gift = assign(:gift, Gift.create!(friend: friend, name: 'Name'))
  end

  it 'renders attributes in <p>' do
    render
  end
end
