module Api
  module V1
    module User1
      class ReportsController < ApplicationController
        before_action :authorize
        before_action :find_reportable

        def create
          @report = @reportable.reports.build(report_params)
          @report.user_id = @current_user.id
          if @report.save
            render json: @post, status: :ok
          else
            render json: @post.errors.full_messages, status: :unprocessable_entity
          end
        end

        private

        def find_reportable
          if params[:comment_id]
            @reportable = Comment.find_by_id(params[:comment_id])
          elsif params[:post_id]
            @reportable = Post.find_by_id(params[:post_id])
          end
        end

        def report_params
          params.permit(:reason)
        end
      end
    end
  end
end
