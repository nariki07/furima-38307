require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    
    context "ユーザー登録ができる時" do
      it "nickname,email,password,password_confirmationが存在すれば登録できる" do
      expect(@user).to be_valid
      end
    end

    context "ユーザー登録ができない時" do

      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "メールアドレスが空では登録できない" do
      @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "メールアドレスには@が無いと登録できない" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it "パスワードが空では登録できない" do
      @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "パスワードが5文字以下では登録できない" do
      @user.password = "00000"
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
    end
  end
end
