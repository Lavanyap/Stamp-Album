class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
    	t.integer :user_id
    	t.integer :shared_to
    	t.integer :album_id
      t.timestamps
    end
  end
end
