class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.integer :id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
