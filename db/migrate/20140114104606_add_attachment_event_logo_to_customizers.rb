class AddAttachmentEventLogoToCustomizers < ActiveRecord::Migration
  def self.up
    change_table :customizers do |t|
      t.attachment :event_logo
    end
  end

  def self.down
    drop_attached_file :customizers, :event_logo
  end
end
