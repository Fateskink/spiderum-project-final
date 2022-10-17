module Api
  module V1
    module User1
      class TagsController < ApplicationController
        before_action :authorize
        before_action :admin_user, only: %i[create destroy]

        def index
          @tags = Tag.all
          render json: { tags: @tags }, status: :ok
        end

        def show
          @tag = Tag.friendly.find(params[:id])
          @pagy, @posts = pagy(@tag.posts)
          render json: { metadata: meta_data, posts: @posts }, status: :ok
        end

        def create
          @tag = Tag.new(tag_params)
          if @tag.save
            render json: { tag: @tag }, status: :ok
          else
            render json: { message: 'False to create new tag' }, status: :unprocessable_entity
          end
        end

        def destroy
          @tag = Tag.find(params[:id])
          render json: 'Tag deleted', status: :ok if @tag.destroy
        end

        private

        def tag_params
          params.require(:tag).permit(:tag_name)
        end

        # def admin_user
        #   @current_user.admin?
        # end
      end
    end
  end
end
