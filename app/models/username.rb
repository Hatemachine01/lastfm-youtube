class User < ApplicationRecord
include ActiveModel::Model
  
  attr_accessor :username,
  validates :username,  presence: true
end
