class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
    	t.string :title, null: false, default: ""
    	t.string :company, null: false, default: ""
    	t.string :description, null: false, default: ""
        t.references :user 
      t.timestamps
    end
  end
end
