class CreateComments < ActiveRecord::Migration[8.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :commentable, polymorphic: true
      # t.bigint :commentable_id
      # t.string :commentable_type

      t.timestamps
    end

    # add_index :comments, [:commentable_type, :commentable_id]
  end
end
