class TodosController < ApplicationController
  respond_to :json

  def index
    @todos = Todo.all
    respond_with @todos
  end

  def show
    @todo = Todo.find params[:id]
    respond_with @todo
  end

  def new
    @todo = Todo.new
    respond_with @todo
  end

  def create
    @todo = Todo.create todo_params
    respond_with @todo
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update_attributes(todo_params)
    respond_with @todo
  end

  def complete
    @todo = Todo.find(params[:id])
    @todo.complete
    respond_with @todo
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    respond_with @todo
  end

  private
  def todo_params
    params.require(:todo).permit(:completed, :title)
  end
end