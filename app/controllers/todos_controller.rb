class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
  
    # GET /todos
    def index
      @todos = Todo.all
    end
  
    # GET /todos/1
    def show
      @todo = Todo.find(params[:id])
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
      todo = Todo.create(todo_params)
      redirect_to todo
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
        params.require(:todo).permit(:title, :attended, :time, category_ids:[], categories_attributes: [:name])
      end
  end
  