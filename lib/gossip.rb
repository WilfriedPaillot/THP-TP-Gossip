require 'csv'

class Gossip
  # variables d'instance
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save_to_csv
    CSV.open("db/gossip2.csv", "a") do |csv|
      csv << [@author,@content]
    end
  end

  def self.all
    gossip_provisoire = []
    all_gossips = []
      CSV.foreach("db/gossip2.csv") do |row|
        gossip_provisoire = Gossip.new(row[0],row[1])
        all_gossips << gossip_provisoire
      end
    return all_gossips
  end

  def self.count_all
    rows = []
    CSV.foreach("db/gossip2.csv").with_index do |row, i|
      rows << i+1
    end
    puts rows.empty?
    return rows.pop || 0
  end

end