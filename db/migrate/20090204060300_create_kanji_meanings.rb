class CreateKanjiMeanings < ActiveRecord::Migration
  def self.up
    create_table :kanji_meanings do |t|
      t.string :meaning
      t.references :kanji

      t.timestamps
    end
  end

  def self.down
    drop_table :kanji_meanings
  end
end
