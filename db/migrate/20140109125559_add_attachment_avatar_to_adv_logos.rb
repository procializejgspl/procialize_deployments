class AddAttachmentAvatarToAdvLogos < ActiveRecord::Migration
  def self.up
    change_table :adv_logos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :adv_logos, :avatar
  end
end
