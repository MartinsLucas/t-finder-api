# frozen_string_literal: true

class Profile < ApplicationRecord
  before_create :shorten_url

  include Rails.application.routes.url_helpers
  include Shortener::ShortenerHelper

  validates :profile_name, presence: true
  validates :url, presence: true

  def fetch_username
    username = WebScrapper.new(self.url).get_username
    unless username.nil?
      self.update(username: username)
    else
      self.errors.add(:username, "Username could not be fetched")
    end
  end

  def fetch_description
    description = WebScrapper.new(self.url).get_description
    unless description.nil?
      self.update(description: description)
    else
      self.errors.add(:description, "Description could not be fetched")
    end
  end

  private

  def shorten_url
    host_address = ENV["APP_HOST"]
    host_address += ':' + ENV["APP_PORT"] unless ENV["APP_PORT"] == '80'

    self.url = short_url(self.url, url_options: { host: host_address, protocol: 'http' })
  end
end
