class CreateUaccount < ActiveRecord::Migration[7.0]
  def change
    create_table :uaccounts do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :gender
      t.string :address
      t.bigint :contact
      t.string :state
      t.timestamps
    end
  end
end
