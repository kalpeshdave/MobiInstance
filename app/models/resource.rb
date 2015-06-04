class Resource < ActiveRecord::Base
  attr_accessible :description, :email, :first_name, :last_name, :logo_url, :name, :other_company_option, :position, :rating_option, :show_comment_button, :instance_ids
  default_scope order('name asc')
  has_and_belongs_to_many :instances, :join_table => :instances_resources
end
