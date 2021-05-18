module Api
	module V1  
        class KeysController < ApplicationController
            def index
                keys = Key.all
                render json: keys
            end
            def create
                o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
                key = (0...50).map { o[rand(o.length)] }.join    
                @key = Key.new({
                    key: key
                }) 
                if @key.save 
                  render json: @key, status: :created
                else
                  render json: { errors: @key.errors.full_messages },
                         status: :unprocessable_entity
                end
              end 
        end
    end
end
