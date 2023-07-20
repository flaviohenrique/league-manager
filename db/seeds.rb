# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

initial_data = YAML.load(File.read(Rails.root.join("config", "2023_season.yaml")), symbolize_names: true)

season = Season.find_or_create_by(name: 2023)

initial_data[:teams].each do |team|
  team_name, drivers = team.first

  team = Team.find_or_create_by(name: team_name.to_s)

  drivers.each do |driver_name|
    Driver.find_or_create_by(name: driver_name).tap do |driver|
      SeasonDriver.find_or_create_by(
        season: season,
        team: team,
        driver: driver)
    end
  end
end

initial_data[:races].each.with_index do |races, index|
  season_race_name, circuit = races.first

  circuit = Circuit.create_with(city: circuit[1], country: circuit[2])
    .find_or_create_by(name: circuit[0])

  SeasonRace.create_with(order: index.next, name: season_race_name, race_type: 'feature').find_or_create_by(
    circuit_id: circuit.id,
    season_id: season.id
  )
end

AdminUser.create_with(password: 'password', password_confirmation: 'password')
  .find_or_create_by(email: 'admin@example.com')
