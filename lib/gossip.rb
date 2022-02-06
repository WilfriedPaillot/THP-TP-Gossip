require 'csv'

class Gossip
  attr_reader :author, :content, :id


  def initialize(id, author, content)
    @author = author
    @content = content
    @id = id
  end

  def save_to_csv
    CSV.open("db/gossip.csv", "a") do |csv|
      csv << [@id,@author,@content]
    end
  end

  def self.all
    gossip_provisoire = []
    all_gossips = []
      CSV.foreach("db/gossip.csv") do |row|
        gossip_provisoire = Gossip.new(row[0],row[1],row[2])
        all_gossips << gossip_provisoire
      end
    return all_gossips
  end

  def self.count_all
    rows = []
    CSV.foreach("db/gossip.csv").with_index do |row, i|
      rows << i+1
    end
    return rows.pop || 0
  end

  def self.delete_by(id)
    gossip_provisoire = []
    all_gossips = []
    output = []
      CSV.foreach("db/gossip.csv") do |row|
        gossip_provisoire = Gossip.new(row[0],row[1],row[2])
        all_gossips << gossip_provisoire
      end
        output = all_gossips.delete_if{|gossip| gossip.id.to_i == id }
      CSV.open("db/gossip.csv","w") do |csv|
        output.each do |gossip|
          csv << [gossip.id,gossip.author,gossip.content]
        end
      end
  end

end