class CreateInstancesResources < ActiveRecord::Migration
  def up
    create_table :instances_resources, :id => false do |t|
        t.references :instance
        t.references :resource
    end
    add_index :instances_resources, [:instance_id, :resource_id]
    add_index :instances_resources, :resource_id
  end

  def down
    drop_table :instances_resources
  end
end
