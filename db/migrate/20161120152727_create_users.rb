class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :has_drawn
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
