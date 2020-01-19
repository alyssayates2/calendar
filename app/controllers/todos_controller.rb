class TodosController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @todos = current_user.todos
    end
  
    def show
      @todo = current_user.todos.find_by(id: params[:id])
    end
  
    def new
      @todo = current_user.todos.build
    end
  
    def edit
      @todo = current_user.todos.find_by(params[:id])
      if @todo
        render 'edit'
      else 
        redirect_to todos_path
      end
    end
  
    def create
      @todo = current_user.todos.build(todo_params)
      if @todo.save
        redirect_to todo_path(@todo)
      else 
        render :new 
      end 
    end
  
    def update
      @todo = current_user.todos.find(params[:id])
      if @todo.update(todo_params)
        redirect_to @todo
      else
        render :edit
     end
    end
  
    def destroy
      @todo = current_user.todos.find_by(params[:id])
      if @todo
        @todo.destroy
      end 
      redirect_to todos_path
    end
  
    private
  
      def todo_params
        params.require(:todo).permit(:title, :attended, :time, :category_id, category_attributes: [:name])
      end
  end
  