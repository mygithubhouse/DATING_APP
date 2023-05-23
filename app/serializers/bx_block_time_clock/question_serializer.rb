module BxBlockTimeClock
  class QuestionSerializer < BuilderBase::BaseSerializer
    attributes *[
        :id,
        :question_text,
        :question_type
    ]
  end
end