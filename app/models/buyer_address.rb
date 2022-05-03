class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :ship_from_area_id, :municipalities, :address, :building_name, :telephone,
                :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :address
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: 'is too short' }
  end
  validates :ship_from_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 購入情報を保存し、変数buyerに代入する
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    # 配送先情報を保存する
    # buyer_idには、変数buyerのidと指定する
    Address.create(postal_code: postal_code, ship_from_area_id: ship_from_area_id, municipalities: municipalities,
                   address: address, building_name: building_name, telephone: telephone, buyer_id: buyer.id)
  end
end
