class CreateStamps < ActiveRecord::Migration
  def change
    create_table :stamps do |t|
    	t.integer :year_of_issue
    	t.integer :country_id
    	t.integer :number_of_stamps_in_collection
    	t.integer :number_of_stamps_issued
    	t.integer :category_id
    	t.integer :user_id
    	t.integer :album_id
    	t.float :face_value
    	t.string :image_path



      t.timestamps
    end
  end
end
