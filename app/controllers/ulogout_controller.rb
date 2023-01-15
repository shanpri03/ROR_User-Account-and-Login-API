class UlogoutController < ApplicationController

   #skip_before_action :verify_authenticity_token

   
        def index
            session.delete(:current_user_id)
            render json: "Logged out successfully"
        end
        
    

end
