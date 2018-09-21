class UserSessions < ActiveRecord::Migration[5.1]
  def change
	create_table :user_sessions do |t|
		t.integer   :appuser_id    
        t.integer  :user_type      
		t.string :sess_token     
    	 t.string :device_id     
		 t.string :device_token  
		 t.boolean :login_status 
		 t.integer :device_type    
		 t.integer :badge          
		 t.date :last_login    
		 t.date :last_logout  
		 t.date :session_expiry
		 t.integer :debug_mode
		   
		 t.timestamps
	end	
  end
end
