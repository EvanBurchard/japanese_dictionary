class CreateWordMeanings < ActiveRecord::Migration
  def self.up
    create_table :word_meanings do |t|
      t.string :meaning
      t.references :word

      t.timestamps
    end
  end

  def self.down
    drop_table :word_meanings
  end
end
