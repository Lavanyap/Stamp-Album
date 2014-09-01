class Category < ActiveRecord::Base
	has_many :stamps
	validates_uniqueness_of :name, :case_sensitive => false
end
