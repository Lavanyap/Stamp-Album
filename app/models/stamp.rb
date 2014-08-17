class Stamp < ActiveRecord::Base
	belongs_to :album
	belongs_to :user
	belongs_to :category
	belongs_to :country
	validates :country, presence: true
	validates :category, presence: true
	validates :year_of_issue, presence: true
end
