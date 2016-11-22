class CreateConversors < ActiveRecord::Migration
  def change
    create_table :conversors do |t|

      t.timestamps null: false
    end
  end
end
