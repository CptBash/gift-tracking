# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GiftsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/friends/1/gifts/new').to route_to('gifts#new', friend_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/friends/1/gifts/1').to route_to('gifts#show', friend_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/friends/1/gifts/1/edit').to route_to('gifts#edit', friend_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/friends/1/gifts').to route_to('gifts#create', friend_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/friends/1/gifts/1').to route_to('gifts#update', friend_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/friends/1/gifts/1').to route_to('gifts#update', friend_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/friends/1/gifts/1').to route_to('gifts#destroy', friend_id: '1', id: '1')
    end
  end
end
