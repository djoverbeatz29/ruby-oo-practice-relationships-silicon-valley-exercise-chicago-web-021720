require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

peter_thiel = VentureCapitalist.new("Peter Thiel", 3 * 10 ** 9)
andrew_yang = VentureCapitalist.new("Andrew Yang", 3 * 10 ** 6)

avant = Startup.new("Avant", "Al Goldstein", "Fintech")
peter_thiel.offer_contract(avant, "Seed", 10 ** 8)

p FundingRound.all
p VentureCapitalist.all
p VentureCapitalist.tres_comma_club

binding.pry
0 #leave this here to ensure binding.pry isn't the last line