class CreateKanjis < ActiveRecord::Migration
  def self.up
    create_table :kanjis do |t|
      t.string :character
      t.integer :frequency
      t.integer :stroke_count
      t.integer :jlpt
      t.integer :grade

      t.timestamps
    end
  end

  def self.down
    drop_table :kanjis
  end
end
