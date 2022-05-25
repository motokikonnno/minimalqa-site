require 'rails_helper'

describe Question do
    describe '#create' do

    it "user_id,title,bodyが存在すれば登録できること" do
        question = Question.new(
                    user_id: "1",
                    title: "あなたのお気に入りを知りたい",
                    body: "教えてください" 
        )
        expect(question).to be_valid
    end


    it "user_idがない場合は登録できないこと" do
        question = Question.new(
                    user_id: "",
                    title: "あなたのお気に入りを知りたい",
                    body: "教えてください" 
        )
        expect(question).not_to be_valid
    end



    it "titleがない場合は登録できないこと" do
        question = Question.new(
                    user_id: "1",
                    title: "",
                    body: "教えてください" 
        )
        expect(question).not_to be_valid
    end



    it "bodyがない場合は登録できないこと" do
        question = Question.new(
                    user_id: "1",
                    title: "あなたのお気に入りを知りたい",
                    body: "" 
        )
        expect(question).not_to be_valid
    end



    it "titleが20文字以下であれば登録できること" do
        question = Question.new(
                    user_id: "1",
                    title: "a" * 20,
                    body: "教えてください" 
        )
        expect(question).to be_valid
    end



    it "titleが21文字以上であれば登録できないこと" do
        question = Question.new(
                    user_id: "1",
                    title: "a" * 21,
                    body: "教えてください" 
        )
        expect(question).not_to be_valid
    end



    it "bodyが250文字以下であれば登録できること" do
        question = Question.new(
                    user_id: "1",
                    title: "あなたのお気に入りを知りたい",
                    body: "a" * 250 
        )
        expect(question).to be_valid
    end



    it "bodyが251文字以上であれば登録できないこと" do
        question = Question.new(
                    user_id: "1",
                    title: "あなたのお気に入りを知りたい",
                    body: "a" * 251 
        )
        expect(question).not_to be_valid
    end



    end
end