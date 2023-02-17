class AddAuthorToEntity < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :author, null: false, foreign_key: {to_table: :users}
  end
end
