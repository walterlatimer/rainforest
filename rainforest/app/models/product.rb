class Product < ActiveRecord::Base
	# before_save :default_values
	belongs_to :category
	# has_many :photos,
	has_many :reviews

	# Validation and handling of photos (here is where sizes and defult photo can be set)
	has_attached_file :photo, styles: {
		                        medium: "300x300#",
		                        thumb: "100x100#"
		                      },
		                      default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	validates :name,           presence: true
	validates :price_in_cents, numericality: {
		                           only_integer: true,
		                           greater_than: 0
		                         }
	validates :quantity,       numericality: {
                               only_integer: true,
                               greater_than_or_equal_to: 0
	                           }
	validates :description,    presence: true
	validates :category,       presence: true
	validates :featured,       :inclusion => {:in => [true, false]}

	def self.search(search)
	  where("name ILIKE ?", "%#{search}")
	end

	def formatted_price
		price_in_dollars = price_in_cents.to_f / 100
		sprintf("%.2f", price_in_dollars)
	end

	private
	def default_values
		self.featured ||= false
	end

end
