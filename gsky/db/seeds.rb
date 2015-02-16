#create!方法和create方法的作用类似,只不过遇到无效数据时会抛出异常,而不是返回false,有利于调试.
User.create!(name: "Example User", email:"example@railstutorial.org",password:"foobar",password_confirmation:"foobar",admin:true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:name,email:email,password:password,password_confirmation:password)
end
              
