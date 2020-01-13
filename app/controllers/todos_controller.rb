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
      @todo = Todo.new
    end
  
    # GET /todos/1/edit
    def edit
    end
  
    # POST /todos
    def create
      @todo = Todo.new(todo_params)
  
      respond_to do |format|
        if @todo.save
          format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        else
          format.html { render :new }
        end
        redirect_to @todo
      end
    end
  
    # PATCH/PUT /todos/1
    def update
      respond_to do |format|
        if @todo.update(todo_params)
          format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end
  
    # DELETE /todos/1
    def destroy
      @todo.destroy
      respond_to do |format|
        format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      end
    end
  
    private
      def set_todo
        @todo = Todo.find(params[:id])
      end
  
      def todo_params
        params.require(:todo).permit(:title, :attended, :time, category_ids:[], categories_attributes: [:name])
      end
  end
  