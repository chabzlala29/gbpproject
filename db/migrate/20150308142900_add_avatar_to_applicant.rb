class AddAvatarToApplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :avatar_uid, :string
    add_column :applicants, :avatar_name, :string
  end
end
