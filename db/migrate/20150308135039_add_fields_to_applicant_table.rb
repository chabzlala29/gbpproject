class AddFieldsToApplicantTable < ActiveRecord::Migration
  def change
    add_column :applicants, :firstname, :string
    add_column :applicants, :middlename, :string
    add_column :applicants, :lastname, :string
    add_column :applicants, :nickname, :string
    add_column :applicants, :birthdate, :date
    add_column :applicants, :citizenship, :string
    add_column :applicants, :gender, :integer
    add_column :applicants, :height, :string
    add_column :applicants, :religion, :string
    add_column :applicants, :sss_number, :string
    add_column :applicants, :birthplace, :string
    add_column :applicants, :civil_status, :integer
    add_column :applicants, :weight, :decimal
    add_column :applicants, :tin, :string
    add_column :applicants, :philhealth, :string
    add_column :applicants, :availability_status, :string
    add_column :applicants, :work_experience, :string
  end
end
