require 'rails_helper'

RSpec.describe Identification, type: :model do
  
  before do
    @identification = FactoryBot.build(:identification)
  end

  describe "本人確認ができるとき" do
    
    context "本人確認ができる時" do
      it "last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
      expect(@identification).to be_valid
      end
    end

    context "本人確認ができない時" do

      it "お名前(全角)の名字が空では登録できない" do
      @identification.last_name = ""
      @identification.valid?
      expect(@identification.errors.full_messages).to include("名字を入力してください")
      end
      it "お名前(全角)の名前が空では登録できない" do
      @identification.first_name = ""
      @identification.valid?
      expect(@identification.errors.full_messages).to include("名前を入力してください")
      end
      it "お名前(全角)の名字は全角(漢字・ひらがな・カタカナ)でなければ登録できない" do
      @identification.last_name = "yamada"
      @identification.valid?
      expect(@identification.errors.full_messages).to include("名字は全角文字を使用してください")
      end
      it "お名前(全角)の名前が全角(漢字・ひらがな・カタカナ)でなければ登録できない" do
      @identification.first_name = "taro"
      @identification.valid?
      expect(@identification.errors.full_messages).to include("名前は全角文字を使用してください")
      end
    
      it "お名前カナ(全角)は名字が空では登録できない" do
      @identification.last_name_kana = ""
      @identification.valid?
      expect(@identification.errors.full_messages).to include("名字カナを入力してください")
      end

      it "お名前カナ(全角)は名前が空では登録できない" do
      @identification.first_name_kana = ""
      @identification.valid?
      expect(@identification.errors.full_messages).to include("名前カナを入力してください")
      end
      it "お名前カナ(全角)は名字が全角(カタカナ)でなければ登録できない" do
      @identification.last_name_kana = "山田"
      @identification.valid?
      expect(@identification.errors.full_messages).to include("名字カナは全角カタカナのみで入力して下さい")
      end
      it "お名前カナ(全角)は名前が全角(カタカナ)でなければ登録できない" do
      @identification.first_name_kana = "太郎"
      @identification.valid?
      expect(@identification.errors.full_messages).to include("名前カナは全角カタカナのみで入力して下さい")
      end
      it "生年月日が空では登録できない" do
      @identification.birthday = ""
      @identification.valid?
      expect(@identification.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
