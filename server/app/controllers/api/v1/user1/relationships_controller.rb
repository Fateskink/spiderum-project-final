module Api
  module V1
    module User1
      class RelationshipsController < ApplicationController
        
        def create
          current_user.active_relationships.build(followed_id: @user.id)
          render json: { message: 'Follow' }, status: :ok
        end

        def destroy
          @relationship = current_user.active_relationships.find_by(followed_id: @user.id)
          if @relationship.valid?
            @relationship.destroy
            render json: { message: 'Unfollow' }, status: :ok
          end
        end
      end
    end
  end
end
