# frozen_string_literal: true

json.extract! friend, :id, :created_at, :updated_at
json.url friend_url(friend, format: :json)
