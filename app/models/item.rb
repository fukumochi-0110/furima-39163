class Item < ApplicationRecord
  validates :item_name, :explanation,  :price, :image, presence: true
  validates :category_id, :condition_id, :burden_id, :prefecture_id, :duration_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank" }

  # has_one :order
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :burden
  belongs_to :duration
end
