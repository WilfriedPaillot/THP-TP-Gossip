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
      print "Auteur du potin: "
      puts "#{gossip.author}" 
      print "Le potin: "
      puts "#{gossip.content}"
      puts "-" *20
    end
  end

  def self.sum(total)
    puts total
  end

end