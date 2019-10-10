Article.destroy_all

30.times do
  title = Faker::Name.name
  content = Faker::ChuckNorris.fact
  Article.create(title: title, content: content)
end
