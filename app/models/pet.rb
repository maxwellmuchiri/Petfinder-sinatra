class Pet < ActiveRecord::Base
    belongs_to :owner, class_name: 'User', foreign_key: :owner_id
    validates :name, :breed, :age, :description, presence: true
  
    def self.search(query)
      where("name LIKE ? OR breed LIKE ?", "%#{query}%", "%#{query}%")
    end
  end
  