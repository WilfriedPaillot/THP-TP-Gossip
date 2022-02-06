class View

  def create_gossip
    puts "Saisir l'auteur:"
    print "> "
    @author = gets.chomp
    puts "Saisir le contenu de votre potin:"
    print "> "
    @content = gets.chomp
    return params = {author: @author , content: @content}
  end

  def self.all(all_gossips)
    puts "-" *20
    all_gossips.each do |gossip|
      print "ID du potin: "
      puts "#{gossip.id}" 
      print "Auteur du potin: "
      puts "#{gossip.author}" 
      print "Le potin: "
      puts "#{gossip.content}"
      puts "-" *20
    end
  end

  def self.count(total)
    puts "-" *20
    puts "Votre fichier compte #{total} potins"
    puts "-" *20
  end

  def ask_for_id
    puts "Quel est l'ID du potin à supprimer ?"
    print "> "
    id = gets.chomp.to_i
    return id
  end

  def delete_confirmation
    puts "-"*20
    puts "Votre potin a bien été supprimé"
    puts "-"*20
  end
  

end