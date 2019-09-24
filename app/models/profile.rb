# frozen_string_literal: true

class Profile < ApplicationRecord
  validates :profile_name, presence: true
  validates :url, presence: true
end
