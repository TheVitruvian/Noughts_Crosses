class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, :on => :create

  mount_uploader :avatar, ImageUploader

  attr_accessible :user_id, :name, :avatar, :email, :password, :password_confirmation

  has_many :users_games
  has_many :games, through: :users_games

  def intialize
    self.won = 0
    self.lost = 0
    self.drew = 0
  end

  def is_computer?
    id == 1
  end

end
