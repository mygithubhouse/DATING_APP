ActiveAdmin.register BxBlockQuestionsOfTheDays::QuestionOfTheDay, as: "Question Of TheDays" do
  menu label: "Question Of The Days"
    permit_params :question, :option_1, :option_2, :correct_answer, :date

    index do
      selectable_column
      id_column
      column :date
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
        f.input :date, as: :date_picker
        f.input :question
        f.input :option_1
        f.input :option_2
        f.input :correct_answer
      end
      f.actions
    end
  end
