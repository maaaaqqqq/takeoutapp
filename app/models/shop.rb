class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :parking
  belongs_to :genre
  
  validates :name, :text, :address, :holiday, presence: true
  validates :parking_id, :genre_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :tel, presence: true, format: { with: /\A\d{10,11}\z/ },
                  numericality: { only_integer: true, message: 'is not a number' }
                  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' } do
    validates :name_kana
  end
end