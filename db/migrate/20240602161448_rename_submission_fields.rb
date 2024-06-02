class RenameSubmissionFields < ActiveRecord::Migration[7.1]
  def change
    rename_column :submissions, :name, :nameCandidato
    rename_column :submissions, :email, :emailCandidato
    rename_column :submissions, :mobile_phone, :phoneCandidato
    rename_column :submissions, :resume, :resumeCandidato
  end
end
