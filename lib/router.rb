require 'controller'

class Router
  attr_accessor :controller

  def initialize
    @controller = Controller.new
  end

  def perform
    while true
      puts "Que veux-tu faire?"
      puts "1 --> Créer un gossip"
      puts "2 --> Afficher les gossips"
      puts "3 --> Afficher le nombre de gossips"
      puts "4 --> Supprimer un gossip"
      puts "0 --> Quitter l'app"
      print "> "
      params = gets.chomp.to_i

      case params
        when 1
          puts "Vous allez créer une Gossip"
          @controller.create_gossip
        when 2
          puts "Afficher tous les gossips"
          @controller.index_gossips
        when 3
          puts "Voici le nombre d'entrées dans le CSV"
          @controller.count_all
        when 4
          puts "Supprimer un gossip IDentifié"
          @controller.delete_by_id
        when 0
          puts "Ciao bellao! "
          break
        else
          puts "Invalid param"
      end
    end
  end
  
end