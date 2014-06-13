class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  
  validates :title, presence: true, length: { minimum: 2 }
  
  validates :comment, presence: true, length: { minimum: 5}

  validates :rating, numericality: { only_integer: true }



end
