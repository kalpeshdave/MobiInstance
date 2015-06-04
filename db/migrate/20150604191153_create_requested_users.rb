class CreateRequestedUsers < ActiveRecord::Migration
  def change
    create_table :requested_users do |t|
      t.integer :resource_id
      t.string :name
      t.string :email
      t.string :phone
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.text :feedback
      t.boolean :is_anonymous
      t.string :other_company_name
      t.integer :instance_id

      t.timestamps
    end
  end
end
