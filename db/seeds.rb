User.create(fullname:"Amy Friedman", email: "amy@dbc.edu", password: "password")

User.create(fullname:"Greg Garner", email: "greg@dbc.edu", password: "password")

User.create(fullname:"Kyle Dorsey", email: "kyle@dbc.edu", password: "password")

User.create(fullname:"Henry Fyfe", email: "henry@dbc.edu", password: "password")



Proposal.create(proposer_id: 1, name: "Social Media Dependency", hypothesis: "Lack of Snapchat leads to an overall increase in human happiness.")

Proposal.create(proposer_id: 4, name: "Food Pyramid Reversal", hypothesis: "Better health and happiness achieved by eating more desserts.")

Proposal.create(proposer_id: 2, name: "Best U.S. city", hypothesis: "Chicago is scientifically better than Pittsburgh")

Proposal.create(proposer_id: 3, name: "Hair color to intelligence correlation", hypothesis: "Red heads are smarter on average than any other subsection of people grouped by hair color.")



Experiment.create(experimenter_id: 1, proposal_id: 2, procedure: "Participants will spend one week eating meals composed of >75% dessert food groups; happiness surveys will be collected before and after to compare any difference in reported level of contentment.", materials: "ice cream, cake, cookies")

Experiment.create(experimenter_id: 2, proposal_id: 4, procedure: "Red-haired subject will be chosen at random and challenged in a battle of wits by a non-red-haired opponent.")

Experiment.create(experimenter_id: 3, proposal_id: 1, procedure: "Snapchat will be removed from participant's phones for a period of one month.  Daily check-ins will be documented to ascertain any changes in participant mood.")

Experiment.create(experimenter_id: 4, proposal_id: 3, procedure: "No procedure is necessary to determine the outcome of this proposal. Chicago is just better. Period.")







