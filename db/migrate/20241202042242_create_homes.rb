class CreateHomes < ActiveRecord::Migration[7.0]
  def change
    create_table :homes do |t|
      t.string      :title,            null: false
      t.integer     :address_id,       null: false
      t.integer     :supervisor_id,    null: false
      t.references  :user,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
