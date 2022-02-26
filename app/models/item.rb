class Item < ApplicationRecord
  belongs_to :shop
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :name, :text, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true }
end
