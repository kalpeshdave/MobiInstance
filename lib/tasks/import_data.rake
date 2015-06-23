require 'csv'

namespace :import_data do
  namespace :resources do
    task :from_csv => :environment do
      CSV.foreach("#{Rails.root}/public/files/gold_resources.csv", headers: true) do |row|
        new_hash = Hash[row.to_hash.map { |k, v| [k.downcase.gsub(' ', '_'), v] }]
        new_hash.reject! {|k, v| %w"id created_at updated_at".include? k }
        next if new_hash["name"].blank?
        Resource.create! new_hash
      end
    end
  end
  namespace :requested_users do
    task :from_csv => :environment do
      CSV.foreach("#{Rails.root}/public/files/gold_requested_users.csv", headers: true) do |row|
        new_hash = Hash[row.to_hash.map { |k, v| [k.downcase.gsub(' ', '_'), v] }]
        resource = Resource.find_by_name(new_hash["resource"])
        instance = Instance.find_by_name('gold_new')
        
        next if resource.nil?
        new_hash.reject! {|k, v| %w"id resource".include? k }
        new_hash.merge!({:resource_id => resource.id, :instance_id => instance.id})
        RequestedUser.create! new_hash
      end
    end
  end
  namespace :feedbacks do
    task :from_csv => :environment do
      CSV.foreach("#{Rails.root}/public/files/gold_feedbacks.csv", headers: true) do |row|
        new_hash = Hash[row.to_hash.map { |k, v| [k.downcase.gsub(' ', '_'), v] }]
        resource = Resource.find_by_name(new_hash["resource"])
        instance = Instance.find_by_name('gold_new')

        next if resource.nil?
        new_hash.reject! {|k, v| %w"id resource".include? k }
        new_hash.merge!({:resource_id => resource.id, :instance_id => instance.id})
        Feedback.create! new_hash
      end
    end
  end
end
