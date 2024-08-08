desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  ap Rails.env.development?
  
  if Rails.env.development?
    User.destroy_all

    alice = User.new
    alice.email = "alice@example.com"
    alice.password = "password"
    alice.password_confirmation = "password"
    alice.save

    Thing.destroy_all

    home = Thing.new
    home.name = "Home"
    home.owner_id = alice.id
    home.exclude_from_search = true
    home.can_contain_things = true
    home.save

    ap home.errors.full_messages

    office = Thing.new
    office.name = "Office"
    office.owner_id = alice.id
    office.exclude_from_search = true
    office.can_contain_things = true
    office.save

    living_room = Thing.new
    living_room.name = "Living room"
    living_room.owner_id = alice.id
    living_room.container_id = home.id
    living_room.parent = home
    living_room.exclude_from_search = true
    living_room.can_contain_things = true
    living_room.save

    desk = Thing.new
    desk.name = "Desk"
    desk.owner_id = alice.id
    desk.container_id = office.id
    desk.parent = office
    desk.exclude_from_search = true
    desk.can_contain_things = true
    desk.save

    pen = Thing.new
    pen.name = "Fountain pen"
    pen.owner_id = alice.id
    pen.container_id = desk.id
    pen.parent = desk
    pen.exclude_from_search = false
    pen.can_contain_things = false
    pen.save


  end
end
