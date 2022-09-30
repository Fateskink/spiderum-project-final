module Api
  module V1
    module User1
      class TagsController < ApplicationController
        
        def index
          @tags = Tag.all
          render json: {tags: @tags}, status: :ok
        end

        def create
          @tag = Tag.new(tag_params)
          if @tag.save
            render json: {tag: @tag}, status: :ok
          else
            render json: {message: "False to create new tag"}, status: :unprocessable_entity
          end
        end

        def destroy
          @tag = Tag.find(params[:id])
          if @tag.destroy
            render json: "Tag deleted", status: :ok
          end
        end

      private
        def tag_params
          params.require(:tag).permit(:tag_name)
        end
      end
    end
  end
end
