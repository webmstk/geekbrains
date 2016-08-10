class TasksController < ApplicationController

  # before_action :find_task, only: [ :incontext, :step ]

  def index
    # @context = current_user.tasks.incontext.first
    # @tasks   = current_user.tasks.incomplete.free.recent(5)
  end

  def create
    # permitted = params.permit(:content)
    # @task = current_user.tasks.build permitted
    # render json: { success: @task.save, id: @task.id }
  end

  def incontext
    # result = @task.be_incontext!
    # render json: { success: result, content: @task.content }
  end

  def step
    render text: params[:task_identifier]
    # result = @task.step!
    # render json: { progress: @task.progress, completed: @task.completed, success: result }
  end

  # private
  #
  # def find_task
  #   @task ||= current_user.tasks.find params[:id]
  # end

end
