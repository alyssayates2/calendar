class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
  
    # GET /todos
    def index
      @todos = current_user.todos
    end
  
    # GET /todos/1
    def show
      @todo = current_user.todos.find_by(id: params[:id])
    end
  
    # GET /todos/new
    def new
      @todo = current_user.todos.build
    end
  
    # GET /todos/1/edit
    def edit
    end
  
    # POST /todos
    def create
      @todo = current_user.todos.build(todo_params)
      if @todo.save
        redirect_to todo_path(@todo)
      else 
        render :new 
      end 
    end
  
    # PATCH/PUT /todos/1
    def update
      
    end
  
    # DELETE /todos/1
    def destroy
      @todo.destroy
    end
  
    private
      def set_todo
        @todo = Todo.find(params[:id])
      end
  
      def todo_params
        params.require(:todo).permit(:title, :attended, :time, :category_id, category_attributes: [:name])
      end
  end
  