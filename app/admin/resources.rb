ActiveAdmin.register Resource do
  index do
    column :name
    column :email
    column :first_name
    column :last_name

    default_actions
  end
  
  form do |f|
    f.inputs "Company Detail" do
      f.input :name
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :logo_url
      f.input :position
      f.input :description, as: :text
      f.input :show_comment_button
      f.input :rating_option
      f.input :other_company_option
      f.input :instances, as: :check_boxes
    end
    f.buttons
  end
end
