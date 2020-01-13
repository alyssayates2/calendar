class Todo < ApplicationRecord
    belongs_to :user
    has_many :todo_categories
    has_many :categories, through: :todo_categories

    validates :title, presence: true
    validates :time, presence: true 
    validates :time, uniqueness: { scope: :datetime, message: "take care, don't double book yourself!" }

    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attribute|
            if category_attribute["name"].present?
                category = Category.find_or_create_by(category_attribute)
                self.categories << category 
            end 
        end 
    end 
end
