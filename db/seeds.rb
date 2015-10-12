require 'date'

User.delete_all
Dog.delete_all
DogConnection.delete_all
Event.delete_all
EventInvitation.delete_all
Comment.delete_all
Message.delete_all
PrivateMessage.delete_all
DirectConversation.delete_all

comments =
  ["I'm there! See you soon :)",
    "Sorry, can't make it. Have fun!",
    "Thanks for letting me know and/or inviting me!",
    "I'm a randomly-generated comment. Hello!"
  ]

potential_messages =
  ["I LOVE DOGS",
    "Do you love dogs? Cuz I love dogs.",
    "Anybody want to go to the park and play?",
    "My dog is so funny. Yesterday she balanced a ball on her nose!",
    "Does anyone know about OrganicEats and whether it's safe to give my dog? Any info would be appreciated.",
    "I'm a randomly generated public message. Reply to me!",
    "My dog ran away. Please, please help me find my beloved dog!",
    "I'm going for a walk now. Anyone want to join me? Let's meet at the corner of Main Street and Mulberry!",
    "I have met so many great dog friends on this site. Just wanted to say I love y'all.",
    "Lalalala. Just another day here with the pooch!"
  ]

users = User.create!([
  {username: "larissa", email: "larissa@email.com", password: "password",:lat=> 41.878114,:lng => -87.629798, receive_notices: false},
  {username: "chris", email: "chris@email.com", password: "password", :lat=> 41.878114,:lng=> -87.629798, receive_notices: false},
  {username: "alexis", email: "alexis@email.com", password: "password", :lat=> 41.878114,:lng=> -87.629798, receive_notices: false},
  {username: "rodica", email: "rodica@email.com", password: "password", :lat=> 41.878114,:lng=> -87.629798, receive_notices: false},
  {username: "wyeth", email: "wyeth@email.com", password: "password", :lat=> 41.878114,:lng=> -87.629798, receive_notices: false}
  ])

dogs = Dog.create!([
  {name: "Kira", :owner => User.find_by_username("alexis"), bio: "I am a cuddly beagle who loves to chase squirrels.", profile_img: "http://cdn.akc.org/akcdoglovers/beagleThumb.jpg"},
  {name: "LaSalle", :owner => User.find_by_username("larissa"), bio: "I am an excellent pitbull mix who looks like a chocolate lab and loves to play with other dogs.", profile_img: "http://cdn.akc.org/akcdoglovers/ChesapeakeBayRetThumb.jpg"},
  {name: "Hoss", :owner => User.find_by_username("wyeth"), bio: "I am a big sweetheart, a bloodhound who's always on the chase.", profile_img: "http://cdn.akc.org/akcdoglovers/bloodhoundThumb.jpg"},
  {name: "Sophie", :owner => User.find_by_username("rodica"), bio: "I am a friendly and sociable mastiff.", profile_img: "http://cdn.akc.org/akcdoglovers/mastiffThumb.jpg"},
  {name: "Stella", :owner => User.find_by_username("chris"), bio: "I am playful and energetic staffordshire terrier.", profile_img: "http://cdn.akc.org/akcdoglovers/amStaffTerThumb.jpg"},
  {name: "Fluffy", :owner => users.sample, bio: "I'm a powerful but good-natured chow-chow.", profile_img: "http://cdn.akc.org/akcdoglovers/chowChowThumb.jpg"},
  {name: "Batman", :owner => users.sample, bio: "I am a squeaky and excitable boston terrier. I love tennis balls and being carried around.", profile_img: "http://cdn.akc.org/akcdoglovers/bostonTerThumb.jpg"},
  {name: "BeBop", :owner => users.sample, bio: "I am happy bull terrier who like friends and fun.", profile_img: "http://cdn.akc.org/akcdoglovers/bullTerThumb.jpg"},
  {name: "Rufus", :owner => users.sample, bio: "Don't take my cranky demeanor personally; deep down I'm just an old boxer dog who needs a little extra time to get to know you.", profile_img: "http://cdn.akc.org/akcdoglovers/boxerThumb.jpg"},
  {name: "Butters", :owner => users.sample, bio: "I am a sweet and loveable corgi who loves to go for walks.", profile_img: "http://cdn.akc.org/pembrokewelshcorgiThumb.jpg"},
  {name: "Poppy", :owner => users.sample, bio: "I look like a miniature version of my friend Fluffy, but I'm a pomeranian.", profile_img: "http://cdn.akc.org/akcdoglovers/pomeranianThumb.jpg"},
  {name: "Linnie-Belle", :owner => users.sample, bio: "I am a shy and skittish cocker spaniel, who nonetheless wants to make friends!", profile_img: "http://cdn.akc.org/akcdoglovers/cockerThumb.jpg"}
  ])

dog_connections = DogConnection.create!([
  {:dog => Dog.find_by_name("Kira"), :following => Dog.find_by_name("LaSalle")},
  {:dog => Dog.find_by_name("Kira"), :following => Dog.find_by_name("Hoss")},
  {:dog => Dog.find_by_name("Kira"), :following => Dog.find_by_name("Sophie")},
  {:dog => Dog.find_by_name("Kira"), :following => Dog.find_by_name("Stella")},

  {:dog => Dog.find_by_name("LaSalle"), :following => Dog.find_by_name("Kira")},
  {:dog => Dog.find_by_name("LaSalle"), :following => Dog.find_by_name("Hoss")},
  {:dog => Dog.find_by_name("LaSalle"), :following => Dog.find_by_name("Sophie")},
  {:dog => Dog.find_by_name("LaSalle"), :following => Dog.find_by_name("Stella")},

  {:dog => Dog.find_by_name("Hoss"), :following => Dog.find_by_name("LaSalle")},
  {:dog => Dog.find_by_name("Hoss"), :following => Dog.find_by_name("Sophie")},
  {:dog => Dog.find_by_name("Hoss"), :following => Dog.find_by_name("Stella")},
  {:dog => Dog.find_by_name("Hoss"), :following => Dog.find_by_name("Fluffy")},

  {:dog => Dog.find_by_name("Sophie"), :following => Dog.find_by_name("Hoss")},
  {:dog => Dog.find_by_name("Sophie"), :following => Dog.find_by_name("Stella")},
  {:dog => Dog.find_by_name("Sophie"), :following => Dog.find_by_name("Fluffy")},
  {:dog => Dog.find_by_name("Sophie"), :following => Dog.find_by_name("Batman")},

  {:dog => Dog.find_by_name("Stella"), :following => Dog.find_by_name("Sophie")},
  {:dog => Dog.find_by_name("Stella"), :following => Dog.find_by_name("Fluffy")},
  {:dog => Dog.find_by_name("Stella"), :following => Dog.find_by_name("Batman")},
  {:dog => Dog.find_by_name("Stella"), :following => Dog.find_by_name("BeBop")},

  {:dog => Dog.find_by_name("Fluffy"), :following => Dog.find_by_name("Stella")},
  {:dog => Dog.find_by_name("Fluffy"), :following => Dog.find_by_name("Batman")},
  {:dog => Dog.find_by_name("Fluffy"), :following => Dog.find_by_name("BeBop")},
  {:dog => Dog.find_by_name("Fluffy"), :following => Dog.find_by_name("Rufus")},

  {:dog => Dog.find_by_name("Batman"), :following => Dog.find_by_name("Fluffy")},
  {:dog => Dog.find_by_name("Batman"), :following => Dog.find_by_name("BeBop")},
  {:dog => Dog.find_by_name("Batman"), :following => Dog.find_by_name("Rufus")},
  {:dog => Dog.find_by_name("Batman"), :following => Dog.find_by_name("Butters")},

  {:dog => Dog.find_by_name("BeBop"), :following => Dog.find_by_name("Batman")},
  {:dog => Dog.find_by_name("BeBop"), :following => Dog.find_by_name("Rufus")},
  {:dog => Dog.find_by_name("BeBop"), :following => Dog.find_by_name("Butters")},
  {:dog => Dog.find_by_name("BeBop"), :following => Dog.find_by_name("Poppy")},

  {:dog => Dog.find_by_name("Rufus"), :following => Dog.find_by_name("BeBop")},
  {:dog => Dog.find_by_name("Rufus"), :following => Dog.find_by_name("Butters")},
  {:dog => Dog.find_by_name("Rufus"), :following => Dog.find_by_name("Poppy")},
  {:dog => Dog.find_by_name("Rufus"), :following => Dog.find_by_name("Linnie-Belle")},

  {:dog => Dog.find_by_name("Butters"), :following => Dog.find_by_name("Rufus")},
  {:dog => Dog.find_by_name("Butters"), :following => Dog.find_by_name("Poppy")},
  {:dog => Dog.find_by_name("Butters"), :following => Dog.find_by_name("Linnie-Belle")},
  {:dog => Dog.find_by_name("Butters"), :following => Dog.find_by_name("Kira")},

  {:dog => Dog.find_by_name("Poppy"), :following => Dog.find_by_name("Butters")},
  {:dog => Dog.find_by_name("Poppy"), :following => Dog.find_by_name("Linnie-Belle")},
  {:dog => Dog.find_by_name("Poppy"), :following => Dog.find_by_name("Kira")},
  {:dog => Dog.find_by_name("Poppy"), :following => Dog.find_by_name("Fluffy")},
  {:dog => Dog.find_by_name("Poppy"), :following => Dog.find_by_name("LaSalle")},

  {:dog => Dog.find_by_name("Linnie-Belle"), :following => Dog.find_by_name("Poppy")},
  {:dog => Dog.find_by_name("Linnie-Belle"), :following => Dog.find_by_name("Kira")},
  {:dog => Dog.find_by_name("Linnie-Belle"), :following => Dog.find_by_name("LaSalle")},
  {:dog => Dog.find_by_name("Linnie-Belle"), :following => Dog.find_by_name("Hoss")}
  ])

events = Event.create!([
  {:creator => users.sample, event_start: DateTime.now + 1.hour, event_end: DateTime.now + 2.hours, location: "123 N Main St, Chicago, IL 60660", description:"Let's go to the park!"},
  {:creator => users.sample, event_start: DateTime.now + 1.day, event_end: DateTime.now + 26.hours, location: "321 N Main St, Chicago, IL 60660", description:"Let's go to the other park!"},
  {:creator => users.sample, event_start: DateTime.now + 5.hours, event_end: DateTime.now + 6.hours, location: "231 N Main St, Chicago, IL 60660", description:"Let's go for an evening walk together!"}
  ])

events.each do |event|
  rand(2..6).times do
    EventInvitation.create!(event: event, :invitee => dogs.sample)
  end
end

events.each do |event|
  rand(0..6).times do
    event.comments.create!(:commenter => users.sample, :content => comments.sample)
  end
end

messages = 25.times.map do
  Message.create!(author: users.sample, lat: 41.878114, lng: -87.629798, :content => potential_messages.sample)
end

# messages = 25.times.map do
#   Message.create!(author: users.sample, lat: 0, lng: 0, :content => potential_messages.sample)
# end

messages.each do |message|
  rand(0..6).times do
    message.comments.create!(:commenter => users.sample, :content => comments.sample)
  end
end

direct_conversations = DirectConversation.create!([
  {subject: "walk now?"},
  {subject: "lost collar"},
  {subject: "dog park trip?"}
  ])

private_messages = PrivateMessage.create!([
  {:user => User.find_by_username("alexis"), :conversation => DirectConversation.find_by_subject("walk now?"), content: "Do you want to go now? It's getting late and going to rain soon..."},
  {:user => User.find_by_username("larissa"), :conversation => DirectConversation.find_by_subject("walk now?"), content: "Yeah definitely. Let's go now."},
  {:user => User.find_by_username("alexis"), :conversation => DirectConversation.find_by_subject("walk now?"), content: "Great, see you soon!"},
  {:user => User.find_by_username("chris"), :conversation => DirectConversation.find_by_subject("lost collar"), content: "Dude, I think I found Hoss's lost collar. Do you want me to bring it over?"},
  {:user => User.find_by_username("wyeth"), :conversation => DirectConversation.find_by_subject("lost collar"), content: "Awesome, thank you! Yes, could you drop it off now?"},
  {:user => User.find_by_username("chris"), :conversation => DirectConversation.find_by_subject("lost collar"), content: "Sure can! See you in a minute."},
  {:user => User.find_by_username("wyeth"), :conversation => DirectConversation.find_by_subject("lost collar"), content: "Perfect, thanks again! So glad you found it!"},
  {:user => User.find_by_username("larissa"), :conversation => DirectConversation.find_by_subject("dog park trip?"), content: "Anyone want to head to the dog park now?"},
  {:user => User.find_by_username("rodica"), :conversation => DirectConversation.find_by_subject("dog park trip?"), content: "I'm in! Let's meet at the park in a few minutes."},
  {:user => User.find_by_username("alexis"), :conversation => DirectConversation.find_by_subject("dog park trip?"), content: "Me too, see you all soon!"}
  ])




