class Album < ActiveRecord::Base
	belongs_to :user
	has_many :stamps
	has_many :shares, through :user
	validates :album_name, :uniqueness => {:scope => :user_id}
end
