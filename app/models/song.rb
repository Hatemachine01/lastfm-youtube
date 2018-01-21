class Song < ApplicationRecord

#validations
validates_presence_of :username_id, :title
end
