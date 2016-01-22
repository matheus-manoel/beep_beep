User.create!( name:                  "Matheus",
              email:                 "matheuscmanoel@gmail.com",
              password:              "foobar",
              password_confirmation: "foobar",
              admin: true )

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@exemple.com"
  password = "password"
  User.create!( name:                  name,
                email:                 email,
                password:              password,
                password_confirmation: password )
end