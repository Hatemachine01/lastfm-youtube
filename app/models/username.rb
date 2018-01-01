class Username < ApplicationRecord
include ActiveModel::Validations
  
attr_accessor :username
validates :username,  presence: true

end
