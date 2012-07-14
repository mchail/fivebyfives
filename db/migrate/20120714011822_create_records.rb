class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.date :date

      t.timestamps
    end
  end
end
