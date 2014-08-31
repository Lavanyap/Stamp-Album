class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :albums
	has_many :stamps
  has_many :shares
	has_many :shared_albums, :through =>:shares, :source =>:album
	validates_uniqueness_of :email

  	validates :name, presence: true

  	validates :email, presence: true
end
