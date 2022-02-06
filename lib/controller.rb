require 'gossip'
require 'view'

class Controller

  def initialize
    @view = View.new
  end
  
  def create_gossip
    params = @view.create_gossip
    id = (Gossip.count_all)+1
    gossip = Gossip.new(id,params[:author],params[:content])
    gossip.save_to_csv
  end

  def index_gossips
    potins = Gossip.all
    View.all(potins)
  end

  def count_all
    View.count(Gossip.count_all)
  end

  def delete_by_id
    list = self.index_gossips
    id = @view.ask_for_id
    puts "id recu #{id}"
    Gossip.delete_by(id)
    @view.delete_confirmation
  end

end