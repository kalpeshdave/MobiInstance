class Feedback < ActiveRecord::Base
  attr_accessible :company_name, :created_at, :email, :feedback, :first_name, :instance_id, :is_anonymous, :last_name, :other_company_name, :phone, :resource_id, :updated_at, :user_rating

  belongs_to :resource
  belongs_to :instance

  validates :first_name, :presence => true
  validates :last_name, :presence => true,
                        :unless => Proc.new{|u| u.attributes['first_name'].blank?  }

  validates :email, :presence => true,
                    :unless => Proc.new{|u| u.attributes['first_name'].blank?  || u.attributes['last_name'].blank?}
  validates :email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i},
                    :unless => Proc.new{|u| u.attributes['first_name'].blank? || u.attributes['last_name'].blank? || u.attributes['email'].blank? }

  validates :company_name, :presence => true,
                           :unless => Proc.new{|u| u.attributes['first_name'].blank? || u.attributes['last_name'].blank? || u.attributes['email'].blank? }

  def name
    "#{first_name} #{last_name}"
  end
end
