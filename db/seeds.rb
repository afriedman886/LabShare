

email_ending = [".edu", ".gov"]

15.times{User.create!(fullname: Faker::Name.name , email: (Faker::Name.name + "@WUPHF" + email_ending.sample) , password: "password")}

# User.create(fullname:"Amy Friedman", email: "amy@dbc.edu", password: "password")

# User.create(fullname:"Greg Garner", email: "greg@dbc.edu", password: "password")

# User.create(fullname:"Kyle Dorsey", email: "kyle@dbc.edu", password: "password")

# User.create(fullname:"Henry Fyfe", email: "henry@dbc.edu", password: "password")
proposal_ideas = [Faker::Space.star_cluster, Faker::Space.constellation, Faker::Beer.alcohol, Faker::StarWars.droid, Faker::StarWars.planet]

25.times{Proposal.create!(proposer_id: rand(1..5), name: proposal_ideas.sample, hypothesis: Faker::Lorem.sentence(10))}

# Proposal.create(proposer_id: 1, name: "Social Media Dependency", hypothesis: "Lack of Snapchat leads to an overall increase in human happiness.")

# Proposal.create(proposer_id: 4, name: "Food Pyramid Reversal", hypothesis: "Better health and happiness achieved by eating more desserts.")

# Proposal.create(proposer_id: 2, name: "Best U.S. city", hypothesis: "Chicago is scientifically better than Pittsburgh")

# Proposal.create(proposer_id: 3, name: "Hair color to intelligence correlation", hypothesis: "Red heads are smarter on average than any other subsection of people grouped by hair color.")

ingredients = "500 ml of de-ionized water, Water, Sodium bicarbonate, Soil, Hydrogen, Carbon dioxcide"


50.times{
  new_experiment =  Experiment.create!(experimenter_id: rand(5..10), proposal_id: rand(1..25), procedure: Faker::Hipster.paragraph(4), materials: ingredients)
  rand(1..5).times{Observation.create!(experiment_id: new_experiment.id, content: Faker::Hacker.say_something_smart)}
}



# Experiment.create(experimenter_id: 1, proposal_id: 2, procedure: "Participants will spend one week eating meals composed of >75% dessert food groups; happiness surveys will be collected before and after to compare any difference in reported level of contentment.", materials: "ice cream, cake, cookies")

# Experiment.create(experimenter_id: 2, proposal_id: 4, procedure: "Red-haired subject will be chosen at random and challenged in a battle of wits by a non-red-haired opponent.")

# Experiment.create(experimenter_id: 3, proposal_id: 1, procedure: "Snapchat will be removed from participant's phones for a period of one month.  Daily check-ins will be documented to ascertain any changes in participant mood.")

# Experiment.create(experimenter_id: 4, proposal_id: 3, procedure: "No procedure is necessary to determine the outcome of this proposal. Chicago is just better. Period.")


75.times{Comment.create!(commenter_id: rand(10..15), commentable_id: rand(1..25), commentable_type: "Proposal", content: Faker::Hacker.say_something_smart)}

150.times{Comment.create!(commenter_id: rand(10..15), commentable_id: rand(1..50), commentable_type: "Experiment", content: Faker::Hacker.say_something_smart)}


25.times { Experiment.all.sample.update(status: "Closed") }




