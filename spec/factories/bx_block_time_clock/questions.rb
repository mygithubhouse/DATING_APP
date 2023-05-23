FactoryBot.define do
  factory :question, class: 'BxBlockQuestionLevalOnes::QuestionLevalOne' do
    question {"what would you pick ?"}
    option_1 {"Vibrate nigbhood"}
    option_2 {"a city with clean"}
    correct_answer {"Vibrate nigbhood"}
  end
end
