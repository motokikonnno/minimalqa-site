require 'rails_helper'

describe User do
    describe '#create' do


    it "name,password,password_confirmationが存在すれば登録できること" do
        user = User.new(
                name: "太郎",
                password: "password",
                password_confirmation: "password"
        )
        expect(user).to be_valid
    end



    it "nameがない場合は登録できないこと" do
        user = User.new(
                name: "",
                password: "password",
                password_confirmation: "password"
        )
        user.valid?
        expect(user).not_to be_valid
    end



    it "passwordがない場合は登録できないこと" do
        user = User.new(
                name: "太郎",
                password: "",
                password_confirmation: "password"
        )
        user.valid?
        expect(user).not_to be_valid
    end


    

    it "password_confirmationがない場合は登録できないこと" do
        user = User.new(
                name: "太郎",
                password: "password",
                password_confirmation: ""
        )
        user.valid?
        expect(user).not_to be_valid
    end



    end
end