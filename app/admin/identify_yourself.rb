ActiveAdmin.register BxBlockIdentifyYourself::IdentifyYourself, as: "Identify Yourself Question" do
  menu label: "Identify Yourself"
    permit_params :question, :option1, :option2, :option3, :option4, :option5

    index do
      selectable_column
      id_column
      column :question
      column :option1
      column :option2
      column :option3
      column :option4
      column :option5
      actions
    end

    filter :question
    filter :created_at

    form do |f|
      f.inputs do
        f.input :question
        f.input :option1
        f.input :option2
        f.input :option3
        f.input :option4
        f.input :option5
      end
      f.actions
    end
  end
