module AccountBlock
  class QuestionListSerializer < BuilderBase::BaseSerializer
    attributes(:question, :option_1, :option_2)
  end
end
