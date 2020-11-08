
require 'net/ping'
class Url < ApplicationRecord
  before_create :check_suffix, :ping_url
  after_create :generate_short_url, 


  def check_suffix
   self.suffix =  self.suffix.gsub(" ","") if self.suffix
   true
  end
  
  def ping_url
    unless Net::Ping::HTTP.new(long_url,port=80, timeout=10 ).ping?
      errors[:long_url] << "Please enter avalid url "
      throw(:abort)
    end
  end

  def generate_short_url
    self.short_url = SecureRandom.uuid[0..4] 
  end
end
