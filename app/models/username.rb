class Username < ApplicationRecord
require 'json'
require 'open-uri'
include ActiveModel::Validations
  
attr_accessor :username
validates :username,  presence: true


end






