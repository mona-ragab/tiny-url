class Url < ApplicationRecord
  validates :long_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

  before_save :generate_short_url

  def generate_short_url
    self.short_url = SecureRandom.uuid[0..7] if short_url.nil? || short_url.empty?
    true
  end
end
