class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :sender_area
  belongs_to :preparation

  validates :image,     presence: true
  validates :item_name, presence: true
  validates :introduction, presence: true
  validates :item_category_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_payer_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :sender_area_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :preparation_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },format: { with: /\A[0-9]+\z/ }

end
