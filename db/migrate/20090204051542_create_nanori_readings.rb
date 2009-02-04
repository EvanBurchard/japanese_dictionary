class CreateNanoriReadings < ActiveRecord::Migration
  def self.up
    create_table :nanori_readings do |t|
      t.string :reading
      t.references :kanji

      t.timestamps
    end
  end

  def self.down
    drop_table :nanori_readings
  end
end
