class AddFileToCertificates < ActiveRecord::Migration
  def change
    add_column :certificates, :file_uid, :string
    add_column :certificates, :file_name, :string
  end
end
