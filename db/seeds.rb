users = [{:name => 'Agu vel. Bagno', :email => 'dotejrozmowy@yahoo.com', :user_id => 6},
         {:name => 'Zosia', :email => 'z.skoneczna@wp.pl', :user_id => 1},
         {:name => 'Wienio', :email => 'wieniek.kowalczyk@gmail.com', :user_id => 4},
         {:name => 'Pawłu', :email => 'burczykal@gmail.com', :user_id => 5},
         {:name => 'Magda vel. Szpadel', :email => 'magd.kowalczyk@gmail.com', :user_id => 3},
         {:name => 'Filip', :email => 'filip.kapica@gmail.com', :user_id => 2}]

users.each do |user|
  User.create user
end

