# FactoryBot.define do
#   factory :question_leval do
#   end
# end

FactoryBot.define do
  factory :question_leval, class: 'QuestionLevalOnes' do
    question { "what is your name11 " }
    option_1 { 'ok11' }
    option_2 { 'ok11' }
  end
end