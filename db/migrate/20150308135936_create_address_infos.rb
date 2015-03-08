class CreateAddressInfos < ActiveRecord::Migration
  def change
    create_table :address_infos do |t|
      t.integer :applicant_id
      t.string :street
      t.string :village
      t.string :city
      t.string :country
      t.string :phone_home
      t.string :mobile
      t.string :phone_office
      t.string :fax

      t.timestamps null: false
    end
  end
end
