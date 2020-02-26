class VentureCapitalist
    attr_accessor :total_worth
    attr_reader :name

    @@all = []

    def self.all
        @@all
    end

    def self.tres_comma_club
        @@all.find_all { |vc| vc.total_worth >= 10 ** 9 }
    end

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.find_all { |fr| fr.venture_capitalist == self }
    end

    def portfolio
        self.funding_rounds.map { |fr| fr.startup }.uniq
    end

    def biggest_investment
        self.funding_rounds.max_by { |fr| fr.investment }
    end

    def invested(domain)
        self.funding_rounds.find_all { |fr| fr.type == domain }.sum { |fr| fr.investment }
    end

end