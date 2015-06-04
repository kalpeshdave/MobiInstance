class Instance < ActiveRecord::Base
  attr_accessible :description, :name
  validates :name, presence: true
  has_and_belongs_to_many :resources, :join_table => :instances_resources
  has_many :requested_users
end
