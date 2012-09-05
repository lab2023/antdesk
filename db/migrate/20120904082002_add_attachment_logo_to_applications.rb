class AddAttachmentLogoToApplications < ActiveRecord::Migration
  def self.up
    change_table :applications do |t|
      t.has_attached_file :logo
    end
  end

  def self.down
    drop_attached_file :applications, :logo
  end
end
