i = 1
until i == 20
  page = Page.create(text: Faker::Lorem.paragraph, next_page_id: i+1)
  if page.id % 3 == 0
    Challenge.create(page_id: page.id, success_page_id: rand(20), fail_page_id: rand(20))
    page.next_page = nil
    page.save
  end
  i+=1
end

pro_users = []
5.times do
  pro_users << User.create(username:Faker::Internet.user_name, password:Faker::Internet.password, email: Faker::Internet.email)
end

new_users = []
3.times do
  new_users << User.create(username:Faker::Internet.user_name, password:Faker::Internet.password, email:Faker::Internet.email)
end

pro_users.each do |user|
  i = 0
  until i > Challenge.all.count
    outcome = [true,false].sample
    UserChallenge.create(user_id: rand(user.id), challenge_id: i, success: outcome )
    i+=1
  end
end

pro_users.each do |user|
  i = 1
  until i > Page.all.count
    UserPage.create(user_id: user.id, page_id: i)
    i += 1
  end
end
