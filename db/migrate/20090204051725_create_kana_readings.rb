class CreateKanaReadings < ActiveRecord::Migration
  def self.up
    create_table :kana_readings do |t|
      t.string :reading
      t.references :word

      t.timestamps
    end
  end

  def self.down
    drop_table :kana_readings
  end
end
