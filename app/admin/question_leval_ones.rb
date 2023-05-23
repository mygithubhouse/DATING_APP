ActiveAdmin.register BxBlockQuestionLevalOnes::QuestionLevalOne, as: "Question" do
  menu label: "Question leval one"
    permit_params :question, :option_1, :option_2, :correct_answer, :level_id

    index do
      selectable_column
      id_column
      column :level
      column :question
      column :option_1
      column :option_2
      column :correct_answer
      actions
    end

    filter :question
    filter :created_at

    form do |f|
      f.inputs do
        f.input :level_id, as: :select, 
                collection: BxBlockTimeClock::Level.all.map{|l| [l.name, l.id]}
        f.input :question
        f.input :option_1
        f.input :option_2
        f.input :correct_answer
      end
      f.actions
    end
  end
