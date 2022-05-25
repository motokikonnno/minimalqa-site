json.extract! question, :id, :user_id, :title, :body, :best_answer_id, :created_at, :updated_at
json.url question_url(question, format: :json)
