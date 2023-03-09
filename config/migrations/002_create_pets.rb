class CreatePets < ActiveRecord::Migration[6.1]
    def change
      create_table :pets do |t|
        t.string :name, null: false
        t.string :breed, null: false
        t.integer :age, null: false
        t.string :gender, null: false
        t.text :description
        t.belongs_to :user, null: false, foreign_key: true
  
        t.timestamps null: false
      end
    end
  end
  