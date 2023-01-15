require 'bcrypt'
class UinfoController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        current_user = Uaccount.find_by_id(session[:current_user_id])
        render json: current_user
        
    end
    def show 
        v = Uaccount.find(params[:id])
        render json: v
    end
    def create
            v = !params[:name].empty? and !params[:email].empty? and params[:gender].empty? and !params[:password].empty? and !params[:contact].empty? and !params[:state].empty? and !params[:address].empty?
        
            if(v)
             Uaccount.create('name': params[:name], 'email': params[:email], 'address': params[:address], 'password': params[:password], 'contact': params[:contact], 'state': params[:state], 'gender': params[:gender])
             puts p
             render json: "Data added"
            else
             render json: "Data not added"
              end
    end 

    def update
        b = Uaccount.find(params[:id].to_i)
        b.update('name': params[:name], 'email': params[:email], 'address': params[:address], 'password': params[:password], 'contact': params[:contact], 'state': params[:state], 'gender': params[:gender])
        render json: "Data Updated"
    end

    def destroy
        a = Uaccount.find(params[:id].to_i)
        a.destroy
        render json: "Data deleted"
    end

 end

    


