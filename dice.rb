require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do
  "<h1>Dice Roll</h1>
   <ul>
     <li><a href='/dice/2/6'>Roll two 6-sided dice</a></li>
     <li><a href='/dice/2/10'>Roll two 10-sided dice</a></li>
     <li><a href='/dice/1/20'>Roll one 20-sided die</a></li>
     <li><a href='/dice/5/4'>Roll five 4-sided dice</a></li>
   </ul>"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end

# Route for rolling two 10-sided dice
get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  "<h1>2d10</h1>
  <p>You rolled a #{first_die} and a #{second_die} for a total of #{sum}.</p>"
end

# Route for rolling one 20-sided die
get("/dice/1/20") do
  die = rand(1..20)
  "<h1>1d20</h1>
  <p>You rolled a #{die}.</p>"
end

# Route for rolling five 4-sided dice
get("/dice/5/4") do
  die1 = rand(1..4)
  die2 = rand(1..4)
  die3 = rand(1..4)
  die4 = rand(1..4)
  die5 = rand(1..4)
  sum = die1 + die2 + die3 + die4 + die5

  "<h1>5d4</h1>
  <p>You rolled #{die1}, #{die2}, #{die3}, #{die4}, and #{die5} for a total of #{sum}.</p>"
end
