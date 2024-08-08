desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  if Rails.env.development?

    User.destroy_all

    alice = User.new
    alice.email = "alice@example.com"
    alice.password = "password"
    alice.password_confirmation = "password"
    alice.save

    filename = Rails.root.join("lib", "assets", "sample_data.json")

    raw_sample_data = File.read(filename)

    sample_data = JSON.parse(JSON.parse(raw_sample_data))

    thing_hashes = sample_data.fetch("things")

    thing_hashes.each do |thing_hash|
      thing = Thing.new
      thing.owner = alice
      thing.name = thing_hash.fetch("name")
      thing.container = Thing.find_by_name(thing_hash.fetch("container"))
      thing.parent = thing.container
      thing.can_contain_things = thing_hash.fetch("can_contain_things")
      thing.exclude_from_search = thing_hash.fetch("exclude_from_search")
      thing.save
    end


  end
end
