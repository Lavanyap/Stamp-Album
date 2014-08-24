class Stamp < ActiveRecord::Base
	belongs_to :album
	belongs_to :user
	belongs_to :category
	belongs_to :country
	validates :country, presence: true
	validates :category, presence: true
	validates :year_of_issue, presence: true
	has_attached_file :image
	validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
end
