class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    @task.users = @task.users.presence || [current_user]

    redirect_to action: "index"
  end

  private

  def task_params
    params.require(:task).permit(:title, :completed, :users)
  end
end
