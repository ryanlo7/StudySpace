class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
    	t.string :name 
      	t.timestamps
    end
    #has_many :users
  end
end
