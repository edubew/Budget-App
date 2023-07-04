class SessionsController < Devise::SessionsController
    def create
      super do |resource|
        yield resource if block_given?
  
        # Only perform the redirect if the resource is persisted
        if resource.persisted?
          redirect_to after_sign_in_path_for(resource) and return
        end
      end
    end
  end