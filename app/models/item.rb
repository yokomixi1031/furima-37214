class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :item_name,    presence: true
  validates :explanation,  presence: true

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
                      presence: { message: "can't be blank" }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :ship_from_area
  belongs_to :delivery_day


  #選択が「--」の時は保存できないようにする
  validates :category_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :ship_from_area_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_day_id,    numericality: { other_than: 1 , message: "can't be blank"}

end
