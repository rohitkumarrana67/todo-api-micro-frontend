class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  
  def index
    @todos = []
    if params[:type] == 'do'
      @todos = Do.all
    elsif params[:type] == 'progress'
      @todos = Progress.progress
    elsif params[:type] == 'done'
      @todos = Done.done
    else
    end
    render json: @todos
  end


  def show
    render json: @todo
  end


  def create
    @todo = Do.new(todo_params)

    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

 
  def destroy
    @todo.destroy
  end

  private
    
    def set_todo
      @todo = Todo.find(params[:id])
    end

 
    def todo_params
      params.permit(:title,:description,:type)
    end
end
