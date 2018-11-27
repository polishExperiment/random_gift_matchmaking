users = [{:name => 'Jarosław Dylewski', :email => 'jaroslaw.dylewski@interia.pl'},
         {:name => 'Mateusz Korkosz', :email => 'korkosz.mateusz@gmail.com'},
         {:name => 'Marta Majewska', :email => 'm.marta.majewska@gmail.com'},
         {:name => 'Paweł Zwoliński', :email => 'p.zwolin@gmail.com'},
         {:name => 'Nataliia Dobrowolska', :email => 'nmdobrowolska@gmail.com'},
         {:name => 'Piotr Żytkiewicz', :email => 'piotr.zytkiewicz@gmail.com'},
         {:name => 'Michał Rybnik', :email => 'michal.rybnik@solvee.pl'},
         {:name => 'Alina Dudzic', :email => 'alina.dudzic@solvee.pl'},
         {:name => 'Filip Gołaszewski', :email => 'philipgolaszewski@gmail.com'},
         {:name => 'Piotr Tomczak', :email => 'tomcatmi6@o2.pl'}]

users.each do |user|
  User.create user
end

