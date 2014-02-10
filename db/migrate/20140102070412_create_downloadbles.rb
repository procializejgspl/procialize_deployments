class CreateDownloadbles < ActiveRecord::Migration
  def change
    create_table :downloadbles do |t|
      t.attachment :asset_dwnld
      t.integer :track_id

      t.timestamps
    end
  end
end
