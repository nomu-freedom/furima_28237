class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/} do
      validates :family_name
      validates :last_name
    end
    word = /\A[ァ-ヶー－]+\z/
    with_options format: { with: word} do
      validates :family_name_leading
      validates :last_name_leading
    end
    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i} do
      validates :password
      validates :password_confirmation
    end
    validates :email, uniqueness: { case_sensitive: false },
                      format: { with: /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/}
    validates :nickname, uniqueness: { case_sensitive: false },
                         format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :birthday
  end
end
