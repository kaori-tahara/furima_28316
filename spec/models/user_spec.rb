require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do

    context '新規登録がうまくいくとき' do
      it "nickname,email,password,first_name,family_name,first_furigana,family_furigana,birthが存在すれば登録できる" do
       expect(@user).to be_valid
      end

      it "nicknameが40文字以下であれば登録できる" do
        @user.nickname = "aaaaaaaaaabbbbbbbbbbccccccccccdddddddddd"
        expect(@user).to be_valid
      end

      it "passwordが６文字以上であれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまく行かない時' do

     it "nicknameが空だと登録できない" do
       @user.nickname = "" 
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end

     it "nicknameが40文字以上だと登録できない"do
      @user.nickname = "aaaaaaaaaabbbbbbbbbbccccccccccdddddddddda"
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
     end

     it"誕生日が空だと登録できない"do
      @user.birth =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
     end

      it "emailが空では登録できない" do
      @user.email = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it"重複したemailが存在する場合登録できない"do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email 
        another_user.valid?
        binding.pry
        expect(another_user.errors.full_messages).to include("Email has already been taken")
     end

     it"@を含まないemailは登録できない"do
      @user.email = "aaapppee"
      @user.valid? 
      expect(@user.errors.full_messages).to include("Email is invalid")
     end

     it"passwordが空では登録できない"do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end

     it"passwordが6文字以下であれば登録できない"do
     @user.password = "aaaaa"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

     it"passwordに英数字を含めないと登録できない"do
     @user.password = "aaaaaaa"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
     end

     it"passwordが存在してもpassword_confirmationが空では登録できない"do
     @user.password_confirmation = ""
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
     end

     it"first_nameが空だと登録できない"do
     @user.first_name = ""
     @user.valid?
     expect(@user.errors.full_messages).to include("First name can't be blank")
     end

     it"first_nameが全角でないと登録できない"do
     @user.first_name = "kiyoko"
     @user.valid?
     expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
     end

     it"family_nameが空だと登録できない"do
     @user.family_name = ""
     @user.valid?
     expect(@user.errors.full_messages).to include("Family name can't be blank")
     end

     it"family_nameが全角でないと登録できない"do
     @user.family_name = "yamada"
     @user.valid?
     expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
     end

     it"first_furiganaが空だと登録できない"do
     @user.first_furigana = ""
     @user.valid?
     expect(@user.errors.full_messages).to include("First furigana can't be blank")
     end

     it"first_furiganaが全角カタカナでないと登録できない"do
     @user.first_furigana= "きよこ"
     @user.valid?
     expect(@user.errors.full_messages).to include("First furigana 全角(カタカナ)を使用してください")
     end

     it"family_furiganaが空だと登録できない"do
     @user.family_furigana= ""
     @user.valid?
     expect(@user.errors.full_messages).to include("Family furigana can't be blank")
     end

     it"family_furiganaが全角カタカナでないと登録できない"do
     @user.family_furigana= "やまだ"
     @user.valid?
     expect(@user.errors.full_messages).to include("Family furigana 全角(カタカナ)を使用してください")
     end
     
     end

  end
end
