# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(
    [
        {name: "Ben Sisko", bio: "Captain of Deep Space Nine. Singer.", email: "cpt@ds9.com", password: "test"},

        {name: "Kira Nerys", bio: "My given name is Nerys. Bajoran gives family names first... look... I play the drums.", email: "xo@ds9.com", password: "test"},

        {name: "Odo", bio: "I have a passion for justice and piano.", email: "security@ds9.com", password: "test"},

        {name: "Julian Bashir", bio: "There's nothing I like better than relaxing after a long day in the infirmary with a few hours of Jazz Flute.", email: "medical@ds9.com", password: "test"},

        {name: "Jadzia Dax", bio: "I never thought of myself as musical, but I found out recently I have several years of experience.", email: "science@ds9.com", password: "test"},
    
        {name: "Worf Rozchenko", bio: "I like to sing Klingon Opera", email: "tactical@ds9.com", password: "test"},

        {name: "Miles O'Brien", bio: "I've been playing folk guitar since before you were born!", email: "engineering@ds9.com", password: "test"},

        {name: "Jake Sisko", bio: "I write songs and play bass.", email: "jake@siskos.com", password: "test"},

        {name: "Rom", bio: "I love singing!", email: "brother@quarks.com", password: "test"},

        {name: "Dukat", bio: "People focus on my time as the overseer of the Bajoran Occupation, but do they know about my amazing obo skills? No. They don't even ask.", email: "prefect@terroknor.com", password: "test"},
    
        {name: "Kasidy Yates", bio: "Making space for a tuba on my freighter is hard, but I don't know what I'd do without it.", email: "captatin@yatesshipping.com", password: "test"},

        {name: "Damar", bio: "I'm a great backup vocalist, but with a chance I think I could really do something revolutionary.", email: "1297141@cardassianmilitary.com", password: "test"},

        {name: "Martok", bio: "I will play rythm guitar with great honor. Today is a good day to rock.", email: "martok@houseofmartok.com", password: "test"},

        {name: "Gowron", bio: "Eye-opening, face-melting licks from my guitar could be yours, if you will join me in musical combat!.", email: "chancellor@qonos.gov", password: "test"}        
    ]
)

bands = Band.create(
    [
        {name: "The Deep Space Nine Players", bio: "Available for diplomatic events, sector emergencies, and hijinks.", leader_id: User.find_by(name: "Ben Sisko").id},

        {name: "The Bajoran Militants", bio: "Our tone is irresistable.", leader_id: User.find_by(name: "Kira Nerys").id},

        {name: "The Dahar Masters", bio: "Q'Pla!", leader_id: User.find_by(name: "Gowron").id},

        {name: "Remember The Alamo", bio: "We're overcoming the odds.", leader_id: User.find_by(name: "Julian Bashir").id}
    ]
)

venues = Venue.create(
    [
        {name: "Quarks", description: "The best bar in the quadrent!", email: "quark@quarks.com", password: "test", address: "1 Promonade Way", city: "Deep Space Nine", state: "Bajor System"},

        {name: "Sisko's", description: "A charming Creole restaurant. Small stage available indoors or out.", email: "joeseph@siskos.com", password: "test", address: "123 Frenchman Street", city: "New Orleans", state: "Louisiana"},

        {name: "The Coucil Chamber", description: "Dark vibes, great acoustics.", email: "councilchamber@qonos.gov", password: "test", address: "1600 Honor and Glory Boulevard", city: "First City", state: "Q'onos"}
    ]
)

band_members = BandMember.create(
    [
        {band_id: Band.find_by(name: "The Deep Space Nine Players").id, user_id: User.find_by(name: "Ben Sisko").id, status: "Accepted"},
        
        {band_id: Band.find_by(name: "The Deep Space Nine Players").id, user_id: User.find_by(name: "Kira Nerys").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Deep Space Nine Players").id, user_id: User.find_by(name: "Odo").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Deep Space Nine Players").id, user_id: User.find_by(name: "Julian Bashir").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Deep Space Nine Players").id, user_id: User.find_by(name: "Jadzia Dax").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Deep Space Nine Players").id, user_id: User.find_by(name: "Worf Rozchenko").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Deep Space Nine Players").id, user_id: User.find_by(name: "Miles O'Brien").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Bajoran Militants").id, user_id: User.find_by(name: "Kira Nerys").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Bajoran Militants").id, user_id: User.find_by(name: "Odo").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Bajoran Militants").id, user_id: User.find_by(name: "Jake Sisko").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Bajoran Militants").id, user_id: User.find_by(name: "Rom").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Bajoran Militants").id, user_id: User.find_by(name: "Odo").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Bajoran Militants").id, user_id: User.find_by(name: "Kasidy Yates").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Bajoran Militants").id, user_id: User.find_by(name: "Damar").id, status: "Accepted"},        

        {band_id: Band.find_by(name: "The Dahar Masters").id, user_id: User.find_by(name: "Gowron").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Dahar Masters").id, user_id: User.find_by(name: "Worf Rozchenko").id, status: "Accepted"},

        {band_id: Band.find_by(name: "The Dahar Masters").id, user_id: User.find_by(name: "Martok").id, status: "Accepted"},

        {band_id: Band.find_by(name: "Remember The Alamo").id, user_id: User.find_by(name: "Julian Bashir").id, status: "Accepted"},

        {band_id: Band.find_by(name: "Remember The Alamo").id, user_id: User.find_by(name: "Miles O'Brien").id, status: "Accepted"},

        {band_id: Band.find_by(name: "Remember The Alamo").id, user_id: User.find_by(name: "Jake Sisko").id, status: "Accepted"},

        {band_id: Band.find_by(name: "Remember The Alamo").id, user_id: User.find_by(name: "Kasidy Yates").id, status: "Accepted"},

    ]
)

gigs = Gig.create(
    [
        {band_id: 1, venue_id: 1, approval: nil, venue_message: "Tuesday night at Quarks!", time: 1609869600, duration: 90},
        
        {band_id: 3, venue_id: 1, approval: nil, venue_message: "Tuesday night at Quarks!", time: 1610474400, duration: 90},
        
        {band_id: 4, venue_id: 1, approval: nil, venue_message: "Tuesday night at Quarks!", time: 1611079200, duration: 90},
    
        {band_id: 2, venue_id: 1, approval: nil, venue_message: "Tuesday night at Quarks!", time: 1611684000, duration: 90},
    
        {band_id: nil, venue_id: 1, approval: nil, venue_message: "Tuesday night at Quarks!", time: 1612288800, duration: 90},
        
        {band_id: nil, venue_id: 2, approval: nil, venue_message: "Night before MariGras!", time: 1613419200, duration: 60},
        
        {band_id: nil, venue_id: 3, approval: nil, venue_message: "Help us celebrate Qo'bo'val!", time: 1615064400, duration: 120},
    ]
)