class AddAttachmentEventAssetToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :event_asset
    end
  end

  def self.down
    drop_attached_file :events, :event_asset
  end
end
