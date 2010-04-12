class CreateTs < ActiveRecord::Migration
  def self.up
    create_table :ts do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :ts
  end
end
