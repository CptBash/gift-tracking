# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'gifts/index', type: :view do
  before(:each) do
    friend = Friend.create!(name: 'Name', birthday: '2022-01-01')
    assign(:gifts, [
             Gift.create!(friend: friend, name: 'Name'),
             Gift.create!(friend: friend, name: 'Name')
           ])
  end

  it 'renders a list of gifts' do
    render
  end
end
