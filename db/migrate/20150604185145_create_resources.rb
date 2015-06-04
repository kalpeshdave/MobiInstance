class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.text :description
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :logo_url
      t.string :name
      t.boolean :other_company_option
      t.integer :position
      t.boolean :rating_option
      t.boolean :show_comment_button

      t.timestamps
    end
  end
end
