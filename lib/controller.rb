require 'gossip' #model
require 'view'

class Controller

  def initialize
    @view = View.new
  end
  
  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params[:author],params[:content])
    gossip.save_to_csv
  end

  def index_gossips
    # Demander au model un array qui contient tous les potins que l'on a en base
    potins = Gossip.all
    # Demander à la view d’exécuter sa propre méthode index_gossips qui affichera tous les potins
    View.all(potins)
  end

  def count_all
    View.sum(Gossip.count_all)
  end

end