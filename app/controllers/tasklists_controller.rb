class TasklistsController < ApplicationController

    skip_before_action :logged_in?, only: [:create, :index]

    def index 
        @tasklists = Tasklist.all 
        render json: @tasklists
    end 

    def create 
        @tasklist = Tasklist.create(tasklist_params)

        render json: @tasklist, status: :created
    end 

    private 

    def tasklist_params 
        params.require(:tasklist).permit(:user_id, :task_id)
    end 


end
