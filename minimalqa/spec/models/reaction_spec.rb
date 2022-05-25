require 'rails_helper'

describe Reaction do
    describe '#create' do

    it "user_id,answer_id,bodyが存在すれば登録できること" do
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
        reaction = answer.reactions.build(
                    user_id: "1",
                    answer_id: "answer.id",
                    body: "教えてください" 
        )
        expect(reaction).to be_valid
    end



    it "user_idがない場合に登録できないこと" do
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
        reaction = answer.reactions.build(
                    user_id: "",
                    answer_id: "answer.id",
                    body: "教えてください" 
        )
        expect(reaction).not_to be_valid
    end



    it "answer_idがない場合に登録できないこと" do
        reaction = Reaction.new(
                    user_id: "1",
                    answer_id: "",
                    body: "教えてください"
        )
        expect(reaction).not_to be_valid
    end



    it "bodyがない場合に登録できないこと" do
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
        reaction = answer.reactions.build(
                    user_id: "",
                    answer_id: "answer.id",
                    body: "" 
        )
        expect(reaction).not_to be_valid
    end



    it "bodyの文字数が140字以内であれば登録できること" do
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
        reaction = answer.reactions.build(
                    user_id: "1",
                    answer_id: "answer.id",
                    body: "a" * 140 
        )
        expect(reaction).to be_valid
    end



    it "bodyの文字数が141字以上であれば登録できないこと" do
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
        reaction = answer.reactions.build(
                    user_id: "1",
                    answer_id: "answer.id",
                    body: "a" * 141 
        )
        expect(reaction).not_to be_valid
    end


    end
end