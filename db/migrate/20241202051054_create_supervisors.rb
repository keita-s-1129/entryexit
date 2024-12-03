class CreateSupervisors < ActiveRecord::Migration[7.0]
  def change
    create_table :supervisors do |t|
      t.string :supervisor, null: false


      t.timestamps
    end
  end
end
