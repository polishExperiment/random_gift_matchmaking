users = [{:name => 'Agu vel. Bagno', :email => 'dotejrozmowy@yahoo.com'},
         {:name => 'Zosia', :email => 'z.skoneczna@wp.pl'},
         {:name => 'Wienio', :email => 'wieniek.kowalczyk@gmail.com'},
         {:name => 'Pawłu', :email => 'burczykal@gmail.com'},
         {:name => 'Magda vel. Szpadel', :email => 'magd.kowalczyk@gmail.com'}]

users.each do |user|
  User.create user
end

