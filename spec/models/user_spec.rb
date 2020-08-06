require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
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
    it "パスワードは2回入力しないと登録できない" do
      
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
