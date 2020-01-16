class Todo < ApplicationRecord
    belongs_to :user
    belongs_to :category
    accepts_nested_attributes_for :category

    validates :title, presence: true
    validates :time, presence: true 

    def category_attributes=(attributes_hash)
        binding.pry
        attributes_hash.values.each do |category_attribute|
            binding.pry
            if category_attribute["name"].present?
                category = Category.find_or_create_by(category_attribute)
                self.categories << category 
            end 
        end 
    end 
end
