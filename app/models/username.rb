class Username < ApplicationRecord
require 'json'
require 'open-uri'

include ActiveModel::Validations
  
attr_accessor :username
validates :username,  presence: true


p api_key = ENV['LASTFM_KEY_ID']

end
