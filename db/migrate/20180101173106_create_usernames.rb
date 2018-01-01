class CreateUsernames < ActiveRecord::Migration[5.1]
  def change
    create_table :usernames do |t|

      t.timestamps
    end
  end
end
