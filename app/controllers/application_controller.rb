class ApplicationController < ActionController::Base
#  include UrlHelper
  protect_from_forgery

  before_filter :load_instance

  private

  def load_instance
    instances = Instance.where(name: request.subdomain)
    if instances.count > 0
      @instance = instances.first
    elsif request.subdomain != 'www'
    	redirect_to public_index_url(subdomain: 'www')
    end
  end
end
