class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.references :school, foreign_key: true
      t.string :name
      t.integer :age
      t.boolean :graduated

      t.timestamps
    end
  end
end
