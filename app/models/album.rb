class Album < ActiveRecord::Base
	belongs_to :user
	has_many :stamps
	has_many :shares, :through =>:user
	validates :album_name, :uniqueness => {:scope => :user_id}
	has_attached_file :image
	validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
end
