# frozen_string_literal: true

class Crew < ApplicationRecord
  belongs_to :user
  has_many :event_crews
  has_many :events, through: :event_crews
end
