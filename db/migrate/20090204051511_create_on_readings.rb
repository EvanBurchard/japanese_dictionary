class CreateOnReadings < ActiveRecord::Migration
  def self.up
    create_table :on_readings do |t|
      t.string :reading
      t.references :kanji

      t.timestamps
    end
  end

  def self.down
    drop_table :on_readings
  end
end
