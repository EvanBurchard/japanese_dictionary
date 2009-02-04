class CreateKunReadings < ActiveRecord::Migration
  def self.up
    create_table :kun_readings do |t|
      t.string :reading
      t.references :kanji

      t.timestamps
    end
  end

  def self.down
    drop_table :kun_readings
  end
end
