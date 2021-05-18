module Api
	module V1  
        class RecordsController < ApplicationController 
            before_action :set_key, only: [:index, :create]

            def index
                records = @key.records.order("score desc, updated_at desc")
                user_score = records.where(user_name: params[:user_name])[0].score rescue 0
                records = records.map{|r| {score: r.score, user_name: r.user_name} }.uniq! {|e| e[:score] }
                
                user_position = records.index {|h| h[:score] == user_score } || -1
                
                if params[:limit] && params[:limit].to_i>0
                  records = records.slice(0..(params[:limit].to_i-1))
                end

                user_position_in_records = records.index {|h| h[:score] == user_score }
                if user_position_in_records
                  records[user_position_in_records][:user_name] = "YOU (#{params[:user_name]})"
                end

                if params[:format] == "text"
                  records = records.map{|r| "#{r[:user_name]} - #{r[:score]}" }
                end 
 

                render json: {
                  score: user_score,
                  position: user_position+1,
                  records: records
                }

            end

            def create  

                @record = @key.records.where(user_name: record_params[:user_name])[0] rescue nil 
                if @record
                  if @record.score.to_f < record_params[:score].to_f && record_params[:score].to_f > 0
                    @record.update({
                      score: record_params[:score]
                    })
                  end
                else
                  @record = @key.records.create({
                    user_name: record_params[:user_name],
                    score: record_params[:score],
                  }) 
                end

                if @record.save 
                  render json: @record, status: :created
                else
                  render json: { errors: @record.errors.full_messages }, status: :unprocessable_entity
                end

            end
            
            private
            
            def set_key
              @key = Key.find_by_key(record_params[:key]) rescue nil
              if !@key
                render json: { errors: {key: ["wrong key"]}}
                return
              end
            end


            def record_params
              params.permit(
                :key, :user_name, :score
              )
            end 
          

        end
    end
end
