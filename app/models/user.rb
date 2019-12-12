class User < ApplicationRecord
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  
  has_many :routes, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy

  validates :username, presence:true

  def name
    self.username
  end

  def user_coordinates
    return unless self.address

    { lng: self.address.lonlat.lon, lat: self.address.lonlat.lat } 
  end
end
