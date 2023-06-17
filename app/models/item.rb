class Item < ApplicationRecord
  validates :item_name, :explanation, :price, :image, presence: true
  validates :category_id, :condition_id, :burden_id, :prefecture_id, :duration_id, presence: true, 
  numericality: { other_than: 1 ,message: "can't be blank" }
  
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range." }
  validates :price, numericality: { only_integer: true, message: "is invalid. Input half-numbers." }

  # has_one :order
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :burden
  belongs_to :duration
