# frozen_string_literal: true

json.array! @gifts, partial: 'gifts/gift', as: :gift
