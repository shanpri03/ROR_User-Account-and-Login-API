require 'bcrypt'
class UloginController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index

        render html: "Hello User!!...Please login to continue"
    end

    def create
        usr = Uaccount.find_by('email': params[:email])
        if (usr.nil?)
            render json: "User account not exist."
        else 
            if (usr.authenticate(params[:password]))
                session[:current_user_id] = usr.id

                render json: "Logged in successfully"
            else
                render json: "Provide correct password"
            end
        end
    end
    
    # def destroy
    #     a = Uaccount.find(params[:id].to_i)
    #     a.destroy
    #     render json: "Data deleted"
    # end
end