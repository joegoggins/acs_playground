class CreatePoc1Dogs < ActiveRecord::Migration
  def self.up
    create_table :poc1_dogs do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :poc1_dogs
  end
end
