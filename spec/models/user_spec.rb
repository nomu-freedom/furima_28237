require 'rails_helper'

describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context "新規登録がうまくいくとき" do
      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録ができないとき" do
      it "nickanameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスに@が入ってないと登録できない" do
        @user.email = "asdf.fdsa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "メールアドレスが重複していると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
      it "パスワードが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは6文字以上でないと登録できない" do
        @user.password = "aaaaa"
        @user.password_confirmation = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end
      it "パスワードが存在してもpassword_confirmationが空だと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "半角英数字混合じゃないと登録できない" do
        @user.password = "ああああああ"
        @user.password_confirmation = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid" && "Password confirmation is invalid")
      end
      it "半角英数字混合じゃないと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid" && "Password confirmation is invalid")
      end
      it "半角英数字混合じゃないと登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid" && "Password confirmation is invalid")
      end
      it "苗字が空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("Family name can't be blank")
      end
      it "苗字は漢字、平仮名、カタカナじゃないと登録できない" do
        @user.family_name = "json"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Family name is invalid")
      end
      it "下の名前は空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "下の名前は漢字、平仮名、カタカナじゃないと登録できない" do
        @user.last_name = "jona"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name is invalid")
      end
      it "苗字のフリガナは空だと登録できない" do
        @user.family_name_leading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name leading can't be blank")
      end
      it "苗字のフリガナはカタカナじゃないと登録できない" do
        @user.family_name_leading = "じぇいそん"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Family name leading is invalid")
      end
      it "苗字のフリガナはカタカナじゃないと登録できない" do
        @user.family_name_leading = "ｼﾞｪｲｿﾝ"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Family name leading is invalid")
      end
      it "下の名前のフリガナは空だと登録できない" do
        @user.last_name_leading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name leading can't be blank")
      end
      it "下の名前のフリガナはカタカナじゃないと登録できない" do
        @user.last_name_leading = "じょな"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name leading is invalid")
      end
      it "下の名前のフリガナはカタカナじゃないと登録できない" do
        @user.last_name_leading = "ｼﾞｮﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name leading is invalid")
      end
      it "生年月日は空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
