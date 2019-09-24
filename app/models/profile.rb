# frozen_string_literal: true

class Profile < ApplicationRecord
  include Rails.application.routes.url_helpers
  include Shortener::ShortenerHelper

  before_save :shorten_url

  validates :profile_name, presence: true
  validates :url, presence: true

  def shorten_url
    host_address = ENV["APP_HOST"]
    host_address += ':' + ENV["APP_PORT"] unless ENV["APP_PORT"] == '80'

    self.url = short_url(self.url, url_options: { host: host_address, protocol: 'http' })
  end
end
