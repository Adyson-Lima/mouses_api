class CreateMice < ActiveRecord::Migration[7.0]
  def change
    create_table :mice do |t|
      t.string :mouse_type
      t.string :description

      t.timestamps
    end
  end
end
