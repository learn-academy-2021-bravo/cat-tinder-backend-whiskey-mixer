class WhiskeysController < ApplicationController
    def index
        whiskeys = Whiskey.all
        render json: whiskeys
    end

    def create
        whiskey = Whiskey.create(whiskey_params)
        if whiskey.valid?
            render json: whiskey
        else 
            render json: whiskey.errors, status: 422
        end
    end    
    
    def update
        whiskey = Whiskey.find(params[:id])
        whiskey.update(whiskey_params)
        render json: whiskey
    end
    
    def destroy
        whiskey = Whiskey.find(params[:id])
    whiskey.destroy
    render json: whiskey
    end


    private 
        def whiskey_params
            params.require(:whiskey).permit( :name, :age, :country, :notes)
        end
end
