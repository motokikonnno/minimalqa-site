require 'rails_helper'

describe Answer do
    describe '#create' do

    it "user_id,question_id,bodyが存在すれば登録できること" do
        question = Question.new(
                    user_id: "1",
                    title: "お気に入り",
                    body: "リンクを貼ってください"
        )
        answer = question.answers.build(
                    user_id: "1",
                    question_id: "question.id",
                    body: "教えてください" 
        )
        expect(answer).to be_valid
    end



    it "user_idがない場合は登録できないこと" do
        question = Question.new(
                    user_id: "1",
                    title: "お気に入り",
                    body: "リンクを貼ってください"
        )
        answer = question.answers.build(
                    user_id: "",
                    question_id: "question.id",
                    body: "教えてください" 
        )
        expect(answer).not_to be_valid
    end



    it "question_idがない場合は登録できないこと" do
        answer = Answer.new(
                    user_id: "1",
                    question_id: "",
                    body: "教えてください" 
        )
        expect(answer).not_to be_valid
    end



    it "bodyがない場合は登録できないこと" do
        question = Question.new(
                    user_id: "1",
                    title: "お気に入り",
                    body: "リンクを貼ってください"
        )
        answer = question.answers.build(
                    user_id: "1",
                    question_id: "question.id",
                    body: "" 
        )
        expect(answer).not_to be_valid
    end



    it "bodyが300文字以下であれば登録できること" do
        question = Question.new(
                    user_id: "1",
                    title: "お気に入り",
                    body: "リンクを貼ってください"
        )
        answer = question.answers.build(
                    user_id: "1",
                    question_id: "question.id",
                    body: "a" * 300 
        )
        expect(answer).to be_valid
    end



    it "bodyが301文字以上であれば登録できないこと" do
        question = Question.new(
                    user_id: "1",
                    title: "お気に入り",
                    body: "リンクを貼ってください"
        )
        answer = question.answers.build(
                    user_id: "1",
                    question_id: "question.id",
                    body: "a" * 301 
        )
        expect(answer).not_to be_valid
    end


    end
end