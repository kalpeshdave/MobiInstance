class HomeController < ApplicationController
  before_filter :load_resources
  def index
    @alchemist_resource = @resources.where(:name => "Alchemist Accelerator")
    @requested_user = RequestedUser.new
  end

  private

  def load_resources
    @resources = @instance.resources
    redirect_to public_index_url(subdomain: 'www') if @resources.blank?
  end
end
