class CreateWhiskeys < ActiveRecord::Migration[6.1]
  def change
    create_table :whiskeys do |t|
      t.string :name
      t.string :country
      t.string :age
      t.string :notes

      t.timestamps
    end
  end
end
