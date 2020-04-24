# README

Load fixture in dev environnement:
> bin/rails db:drop ; bin/rails db:create ; bin/rails db:migrate ; bin/rails db:fixtures:load

Sessions
---------
session[:cart_id] →
session[:desired_path] → current path path (ex: /products/1)
session[:user_id] → user id

Décisions
----------
Gestion des quantités → oui
Plusieurs tags par produit → oui
Aucun tag par produit → **non**
Chaque produit dispose d'un poids pour gérer le coût du transport
Bandeau de communication → oui
Nom pour chaque produit → oui
2 à 4 photos par produit
