class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :provider
      t.references :user, null: false, foreign_key: true
      t.float :balance

      t.timestamps
    end
  end
end
