class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title, null: false, comment: "タイトル"
      t.text :contents, null: false, comment: "記事本文"
      t.timestamps
    end
  end
end
