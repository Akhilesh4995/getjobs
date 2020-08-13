class CreateApplicants < ActiveRecord::Migration[6.0]
  def change
    create_table :applicants do |t|
    	t.string :firstname, null: false, default: ""
    	t.string :lastname, null: false, default: ""
    	t.string :emailid, null: false, default: ""
    	t.string :interest, null: false, default: ""
    	t.string :experience, null: false, default: ""
        t.references :job 

      t.timestamps
    end
  end
end
