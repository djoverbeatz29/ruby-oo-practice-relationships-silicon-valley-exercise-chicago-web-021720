class Startup
    attr_accessor
    attr_reader :founder, :domain, :name

    @@all = []

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        @@all.find { |su| su.name == founder_name }
    end

    def self.domains
        @@all.map { |su| su.domain }.uniq
    end

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    def sign_contract(vc, type, amount)
        FundingRound.new(self, vc, type, amount)
    end

    def funding_rounds
        FundingRound.all.find_all { |fr| fr.startup == self }
    end

    def num_funding_rounds
        self.funding_rounds.length
    end

    def total_funds
        self.funding_rounds.sum { |fr| fr.investment }
    end

    def venture_capitalists
        self.funding_rounds.map { |fr| fr.venture_capitalist }
    end

    def investors
        self.venture_capitalists.uniq
    end

    def big_investors
        self.investors.find_all { |vc| VentureCapitalist.tres_comma_club.include?(vc) }
    end

end