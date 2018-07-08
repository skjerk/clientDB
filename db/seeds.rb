# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Start by destroying existing data in the correct order to avoid foreign key violations
puts "Destroying existing data"
Client.destroy_all
Clienttype.destroy_all
User.destroy_all

# Clienttypes created individually (using bang-notation to display any errors)
Clienttype.create!(text: 'Private Company')
Clienttype.create!(text: 'Public Company')
Clienttype.create!(text: 'Person')

puts "Created #{Clienttype.count} clienttypes"


# Clients created from array

# First select clienttypes to use for new clients
private_company = Clienttype.find_by_text('Private Company')
public_company = Clienttype.find_by_text('Public Company')
person = Clienttype.find_by_text('Person')

client_list = [
    ["WizzBizz Aps","36906766","Fasanvænget 60","2791","Dragør","27286440","","info@wizzbizz.dk","https://www.wizzbizz.dk",private_company],
    ["Sirene Music ApS","36906766","Fasanvænget 60","2791","Dragør","40928569","","pianocarol@gmail.com","http://pianistcarolconrad.com",private_company],
    ["Carsten Skjerk","36906766","Fasanvænget 60","2791","Dragør","27286440","","carsten@skjerk.dk","http://techguy.dk",person],
]
client_list.each do |client|
    Client.create!(
        name: client[0],
        cvr: client[1],
        address: client[2],
        zip: client[3],
        city: client[4],
        phone1: client[5],
        phone2: client[6],
        email: client[7],
        website: client[8],
        clienttype: client[9]
    )
    # puts "Created client #{client[0]}, #{client[1]}"
end

puts "Created #{Client.count} clients"

# Userss created individually (using bang-notation to display any errors)
User.create!(firstname: 'Carsten', lastname: 'Skjerk', email: 'carsten@skjerk.dk')

puts "Created #{User.count} users"
