class CreateKanjiReadings < ActiveRecord::Migration
  def self.up
    create_table :kanji_readings do |t|
      t.string :reading
      t.references :word

      t.timestamps
    end
  end

  def self.down
    drop_table :kanji_readings
  end
end
