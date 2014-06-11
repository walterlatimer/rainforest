class Review < ActiveRecord::Base
  belongs_to :product, :user
end
