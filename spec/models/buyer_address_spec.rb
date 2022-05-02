require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '「配送元の地域」選択が「--」の時は保存できないようにする' do
        @buyer_address.ship_from_area_id = '1'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Ship from area can't be blank")
      end
      it 'manicipalitiesが空だと保存できないこと' do
        @buyer_address.municipalities = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @buyer_address.telephone = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが全角数字だと保存できないこと' do
        @buyer_address.telephone = '２０００'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Telephone is invalid. Input only number')
      end
      it 'telephoneが10桁以上11桁以内の半角数値でないと保存できないこと' do
        @buyer_address.telephone = '090123456'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Telephone is too short')
      end
    end
  end
end

