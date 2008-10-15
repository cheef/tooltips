ActiveRecord::Schema.define(:version => 1) do
   create_table :tooltips, :force => true do |t|     
     t.datetime :created_at     
   end
end
