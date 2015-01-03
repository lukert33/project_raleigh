i = 1
until i == 20
  page = Page.create(text: Faker::Lorem.paragraph, next_page_id: i+1)
  if page.id % 3 == 0
    page.has_challenge = true
    Challenge.create(page_id: page.id, success_page_id: rand(20), fail_page_id: rand(20))
    page.next_page = nil
    page.save
  end
  i+=1
end

5.times do
  User.create(username:Faker::Internet.user_name, password:Faker::Internet.password)
end

User.all.each do |user|
  i = 0
  until i > Challenge.all.count
    outcome = [true,false].sample
    UserChallenge.create(user_id: rand(user.id), challenge_id: i, success: outcome )
    i+=1
  end
end

User.all.each do |user|
  i = 1
  until i > Page.all.count
    UserPage.create(user_id: user.id, page_id: i)
    i += 1
  end
end
