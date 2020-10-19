require 'rails_helper'
describe OrderForm do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.build(:item, user_id: user.id)  
    item.image = fixture_file_upload('public/images/IMG_2846.jpeg')
    item.save
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '購入機能' do
    context '購入がうまくいくとき' do
      it "tokenとpostal_codeとprefecture_idとmunicipalityとaddressとtel_numberが存在すれば登録できる" do
        expect(@order_form).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it "tokenが空では購入できない" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空では購入できない" do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeは数字だけでは購入できない" do
        @order_form.postal_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "prefecture_idが1では購入できない" do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "municipalityが空では購入できない" do
        @order_form.municipality = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end

      it "adderessが空では購入できない" do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it "tel_numberが空では購入できない" do
        @order_form.tel_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel number can't be blank")
      end

      it "tel_numberが数字以外では購入できない" do
        @order_form.tel_number ="あああ"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel number is invalid")
      end

      it "tel_numberが10桁未満だと購入できない" do
        @order_form.tel_number = "123456789"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel number is invalid")
      end

      it "tel_numberがハイフンが含まれてると購入できない" do
        @order_form.tel_number ="123-4567-8910"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel number is invalid")
      end
    end
  end
end