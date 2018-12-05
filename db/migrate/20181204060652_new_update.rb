class NewUpdate < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :username
  		t.string :password
  		t.string :email
  		t.boolean :bravery
      t.boolean :flight
  		t.boolean :speed
  		t.boolean :vision
  	  t.boolean :strength
  	  t.string :avatar
  	end
  	create_table :posts do |t|
      t.string :user_id
      t.string :title
  		t.string :message
  		t.string :tags
  		t.timestamps
  	end
  end
  
  def down
  	drop_table :users
  	drop_table :posts
  end
end
