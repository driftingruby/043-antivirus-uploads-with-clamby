class CreateUploadedFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :uploaded_files do |t|
      t.string  :description
      t.string  :file
      t.string  :file_name
      t.integer :file_size
      t.string  :human_size
      t.timestamps
    end
  end
end
