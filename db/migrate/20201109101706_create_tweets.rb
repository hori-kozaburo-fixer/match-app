class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string     :name,    null: false, limit: 30
      t.text       :text,    null: false, limit: 191
      t.string     :image,   null: false
      t.integer    :team_id, null: false
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
