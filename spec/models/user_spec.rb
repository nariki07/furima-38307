require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    
    it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが空では登録できない" do
      @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスには@が無いと登録できない" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it "パスワードが空では登録できない" do
      @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードが5文字以下では登録できない" do
      @user.password = "00000"
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it "パスワードは半角英数字混合でないと登録できない" do
      @user.password = "000000"
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = 'test12'
      @user.password_confirmation = 'test123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "お名前(全角)の名字が空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "お名前(全角)の名前が空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "お名前(全角)の名字は全角(漢字・ひらがな・カタカナ)でなければ登録できない" do
      @user.last_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it "お名前(全角)の名前が全角(漢字・ひらがな・カタカナ)でなければ登録できない" do
      @user.first_name = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    
    it "お名前カナ(全角)は名字が空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana 全角カタカナのみで入力して下さい")
    end

    it "お名前カナ(全角)は名前が空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カタカナのみで入力して下さい")
    end
    it "お名前カナ(全角)は名字が全角(カタカナ)でなければ登録できない" do
      @user.last_name_kana = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナのみで入力して下さい")
    end
    it "お名前カナ(全角)は名前が全角(カタカナ)でなければ登録できない" do
      @user.first_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナのみで入力して下さい")
    end
    it "生年月日が空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
