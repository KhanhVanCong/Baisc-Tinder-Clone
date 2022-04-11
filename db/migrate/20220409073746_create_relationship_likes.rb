class CreateRelationshipLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :relationship_likes do |t|
      t.integer :liker_id
      t.string :liked_id
      t.string :integer

      t.timestamps
    end
    add_index :relationship_likes, :liker_id
    add_index :relationship_likes, :liked_id
    add_index :relationship_likes, [:liker_id, :liked_id], unique: true
  end
end
