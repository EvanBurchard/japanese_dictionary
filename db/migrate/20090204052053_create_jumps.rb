class CreateJumps < ActiveRecord::Migration
  def self.up
    create_table :jumps do |t|
      t.float :jump_quotient
      t.references :kanji_reading
      t.references :kanji

      t.timestamps
    end
  end

  def self.down
    drop_table :jumps
  end
end
