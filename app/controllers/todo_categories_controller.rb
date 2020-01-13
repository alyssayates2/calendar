class TodoCategoriesController < ApplicationController
    belongs_to :todo
    belongs_to :category
end
