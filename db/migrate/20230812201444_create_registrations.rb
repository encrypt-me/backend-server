class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.string :email, limit: 512
      t.text :public_key
      t.string :code

      t.timestamps
    end
  end
end
