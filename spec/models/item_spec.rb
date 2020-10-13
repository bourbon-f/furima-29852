require 'rails_helper'
describe Item do
  before do
    user = FactoryBot.create(:user)
    @items = FactoryBot.build(:item, user_id: user.id)
    @items.image = fixture_file_upload('public/images/IMG_2846.jpeg')
  end
  
  describe '出品機能' do
    context '出品がうまくいくとき' do
      it "imageとproduct_nameとdescriptionとgenre_idとstatus_idとburden_idとarea_idとdays_idとpriceが存在すれば登録できる" do
        expect(@items).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it "imageが空では出品できない" do
        @items.image = nil
        @items.valid?
        expect(@items.errors.full_messages).to include("Image Please upload your image.")
      end
      it "product_nameが空では出品できない" do
        @items.product_name = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Product name can't be blank")
      end
      it "descriptionが空では出品できない" do
        @items.description = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Description can't be blank")
      end
      it "genre_idが空では出品できない" do
        @items.genre_id = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Genre can't be blank")
      end
      it "genre_idが1では出品できない" do
        @items.genre_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Genre can't be blank")
      end
      it "status_idが空では出品できない" do
        @items.status_id = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Status can't be blank")
      end
      it "status_idが1では出品できない" do
        @items.status_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Status can't be blank")
      end
      it "burden_idが空では出品できない" do
        @items.burden_id = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Burden can't be blank")
      end
      it "area_idが空では出品できない" do
        @items.area_id = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Area can't be blank")
      end
      it "area_idが1では出品できない" do
        @items.area_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Area can't be blank")
      end
      it "priceが空では出品できない" do
        @items.price = ""
        @items.valid?
        expect(@items.errors.full_messages).to include("Price can't be blank")
      end
      it "priceは半角数字以外では入力できない" do
        @items.price = １００００
        @items.valid?
        expect(@items.errors.full_messages).to include("Price is not a number")
      end
      it "priceは300円より低い金額では設定できない" do
        @items.price = 200
        @items.valid?
        expect(@items.errors.full_messages).to include("")
      end
      it "priceは9999999円より高い金額では設定できない" do
        @items.price = 99999999
        @items.valid?
        expect(@items.errors.full_messages).to include("")
      end
    end
  end
end
