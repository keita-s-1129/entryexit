class CreateUserHomes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_homes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :home, null: false, foreign_key: true
      t.string :status, default: '退場中'
      t.datetime :entry_time
      t.datetime :exit_time

      t.timestamps
    end
  end
end
