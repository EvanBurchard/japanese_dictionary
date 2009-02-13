class AddIndexesToJoinedModels < ActiveRecord::Migration
  def self.up
    add_index :jumps, :kanji_reading_id
    add_index :jumps, :kanji_id
    add_index :kana_readings, :word_id
    add_index :kanji_meanings, :kanji_id
    add_index :kanji_readings, :word_id
    add_index :kun_readings, :kanji_id
    add_index :on_readings, :kanji_id    
    add_index :nanori_readings, :kanji_id
    add_index :parts, :word_id
    add_index :word_meanings, :word_id

  end

  def self.down
    remove_index :jumps, :kanji_reading_id
    remove_index :jumps, :kanji_id
    remove_index :kana_readings, :word_id
    remove_index :kanji_meanings, :kanji_id
    remove_index :kanji_readings, :word_id
    remove_index :kun_readings, :kanji_id
    remove_index :on_readings, :kanji_id    
    remove_index :nanori_readings, :kanji_id
    remove_index :parts, :word_id
    remove_index :word_meanings, :word_id

  end
end
