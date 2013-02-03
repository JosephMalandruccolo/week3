class CreateMove < ActiveRecord::Migration
  def change
  	create_table :moves do |m|
  		m.string :item
  		m.string :imageUrl

  		m.timestamps
  	end
  end
end
