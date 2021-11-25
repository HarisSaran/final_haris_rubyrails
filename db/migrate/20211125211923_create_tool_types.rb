class CreateToolTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :tool_types do |t|
      t.references :tool, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
