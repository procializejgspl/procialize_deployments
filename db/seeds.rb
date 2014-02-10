# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Role.create!(:name=>"Delegate",:description=>"some")
r2 = Role.create!(:name=>"Speaker",:description=>"some")
r = Role.create!(:name=>"Organizer",:description=>"some")



u1 = User.create!(:email => 'organizer@ptotem.com',:password => 'password',:password_confirmation => 'password',:name => 'organizer',:role_id=>r.id)
User.create!(:email => 'rakesh@ptotem.com',:password => 'password',:password_confirmation => 'password',:name => 'rakesh',:role_id=>r1.id)
User.create!(:email => 'nilesh@ptotem.com',:password => 'password',:password_confirmation => 'password',:name => 'Nilesh',:role_id=>r1.id)
User.create!(:email => 'rushabh@ptotem.com',:password => 'password',:password_confirmation => 'password',:name => 'Rushabh',:role_id=>r1.id)
#locations..
Location.create!(:name=>"Lounge")
Location.create!(:name=>"Conference Room")
Location.create!(:name=>"Garden")
Location.create!(:name=>"Bar")
Location.create!(:name=>"Coffee  Shop")
Location.create!(:name=>"Lawns")
Location.create!(:name=>"Cafeteria")
Location.create!(:name=>"Lobby")
Location.create!(:name=>"Main Gate")
Location.create!(:name=>"Basketball court")
Location.create!(:name=>"Library")



e1 = EventDay.create!(:name=>"Day1",:event_date=>Date.today)
e2 = EventDay.create!(:name=>"Day2",:event_date=>Date.tomorrow)

Track.create!(:name=>"RoRLearning",:description=>"This is a track for learning ruby on rails")
Track.create!(:name=>"Management",:description=>"This is a track for learning MBA")
Track.create!(:name=>"Meteor",:description=>"This is a track for learning meteor")
Track.create!(:name=>"Abhay",:description=>"The speaker is abhay bhatia")
Track.create!(:name=>"Restaurant",:description=>"The resturant in the front of the campus")
Track.create!(:name=>"Dean",:description=>"The DEAN of the institute")
Track.create!(:name=>"Auditorium",:description=>"The auditorium in the main building")


Event.create!(:name=>"Introduction",:description=>"This is an event which marls the introduction of the conference",:event_day_id=>e1.id,:starting_at=>Date.today,:ending_at=>Date.today)
Event.create!(:name=>"Felicitation",:description=>"This is the event where all CEOs will be presented with a momento by the dean",:event_day_id=>e1.id,:starting_at=>Date.today,:ending_at=>Date.today)
Event.create!(:name=>"Sales Pitch",:description=>"This is the event where delegates can meet all attendees",:event_day_id=>e2.id,:starting_at=>Date.tomorrow,:ending_at=>Date.tomorrow)



Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)
Feed.create!(:message=>"This is a sample feed... an actual feed posted by actual user will come",:user_id=>u1.id)


Customizer.create!(:twitter_handle => "@imsrk",:menu_color_one => "#aaaaaa",:menu_color_two => "#7e7d7c",:menu_font_color => "white",:menu_font_size => "1.0em",:menu_header_color => "white")



