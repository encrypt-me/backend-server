class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :email, limit: 512
      t.text :public_key

      t.timestamps
    end
  end
end
