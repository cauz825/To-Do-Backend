class TasksController < ApplicationController

    skip_before_action :logged_in?, only: [:create, :index, :destroy]

    def index 
        @tasks = Task.all 
        render json: @tasks
    end 


    def create
        @task = Task.create(strong_params)

        render json: @task, status: :created
    end

    def destroy 
        @task = Task.find(params[:id])
        @task.destroy 
        render json: @task
    end 


    private

    def strong_params
        params.require(:task).permit(:name, :difficulty, :experience_points, :category)
    end

end
