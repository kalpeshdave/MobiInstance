class HomeController < ApplicationController
  before_filter :load_resources
  def index
    @alchemist_resource = @all_resources.where(:name => "Alchemist Accelerator")
    @resources = @all_resources - @alchemist_resource
    @requested_user = RequestedUser.new
  end

  private

  def load_resources
    @all_resources = @instance.resources
    redirect_to public_index_url(subdomain: 'www') if @all_resources.blank?
  end
end
