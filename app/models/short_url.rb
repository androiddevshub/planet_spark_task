class ShortUrl < ApplicationRecord
  validates_presence_of :url
  validates :url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :shorten_url
  validates_length_of :url, within: 3..100, on: :create, message: "too long"
  validates_length_of :shorten_url, within: 3..100, on: :create, message: "too long"
  before_validation :generate_url_key
  
  def short
    Rails.application.routes.url_helpers.short_url(shorten_url: self.shorten_url)
  end

  private 

    def generate_url_key
      self.shorten_url = SecureRandom.uuid[0..20] if self.shorten_url.nil? || self.shorten_url.empty?
      true
    end
    
end
