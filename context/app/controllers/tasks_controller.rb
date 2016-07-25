class TasksController < ApplicationController
  def index
    render text: 'Это action index'
  end

  def create
    render text: 'Это action create'
  end

  def incontext
    render text: 'Это action incontext'
  end

  def step
    render text: 'Это action step'
  end
end
