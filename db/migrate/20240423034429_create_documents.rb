class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.references :employee, foreign_key: true
      t.string :description
      t.timestamps
    end
  end
end
