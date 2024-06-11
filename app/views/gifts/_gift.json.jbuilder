# frozen_string_literal: true

json.extract! gift, :id, :created_at, :updated_at
json.url gift_url(gift, format: :json)
