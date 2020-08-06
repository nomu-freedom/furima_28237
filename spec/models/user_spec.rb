require 'rails_helper'

describe User, type: :model do
  before do
    @user = FactryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context "新規登録がうまくいくとき" do
      it "全ての項目が存在すれば登録できる" do
      
      end
      it "メールアドレスに@が入っていると登録できる" do
        
      end
      it "メールアドレスが重複していないとき登録できる" do
        
      end
      it "パスワードは6文字以上だと登録できる" do
        
      end
      it "半角英数字混合だと登録できる" do
        
      end
      it "苗字は漢字、平仮名、カタカナだと登録できる" do
        
      end
      it "下の名前は漢字、平仮名、カタカナだと登録できる" do
        
      end
      it "苗字のフリガナはカタカナだと登録できる" do
        
      end
      it "下の名前のフリガナはカタカナだと登録できる" do
        
      end
    end

    context "新規登録ができないとき" do
      it "nickanameが空だと登録できない" do
      
      end
      it "メールアドレスが空だと登録できない" do
        
      end
      it "メールアドレスに@が入ってないと登録できない" do
        
      end
      it "メールアドレスが重複していると登録できない" do
        
      end
      it "パスワードが空だと登録できない" do
        
      end
      it "パスワードは6文字以上でないと登録できない" do
        
      end
      it "パスワードが存在してもpassword_confirmationが空だと登録できない" do
        
      end
      it "半角英数字混合じゃないと登録できない" do
        
      end
      it "苗字が空だと登録できない" do
        
      end
      it "苗字は漢字、平仮名、カタカナじゃないと登録できない" do
        
      end
      it "下の名前は空だと登録できない" do
        
      end
      it "下の名前は漢字、平仮名、カタカナじゃないと登録できない" do
        
      end
      it "苗字のフリガナは空だと登録できない" do
        
      end
      it "苗字のフリガナはカタカナじゃないと登録できない" do
        
      end
      it "下の名前のフリガナは空だと登録できない" do
        
      end
      it "下の名前のフリガナはカタカナじゃないと登録できない" do
        
      end
      it "生年月日は空だと登録できない" do
        
      end
    end
  end
end
