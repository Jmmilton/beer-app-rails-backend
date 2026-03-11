class User < ApplicationRecord
  has_many :beers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def demo?
    email == "demo@mybrews.app"
  end

end