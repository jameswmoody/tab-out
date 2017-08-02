# THIS SEED FILE DESTROYS EVERYTHING!!!!!

Item.delete_all
Tab.delete_all
Customer.delete_all
Business.delete_all

james = Customer.create(username: 'jameswmoody', password: 'password', vault_id: '203106301', first_name: 'James', last_name: 'Moody', phone: '+13121234567', email: 'james@james.com')
evan = Customer.create(username: 'ehickle', password: 'password', vault_id: '699547769', first_name: 'Evan', last_name: 'Hickle', phone: '+13121234568', email: 'evan@evan.com')
nico = Customer.create(username: 'nicoglennon', password: 'password', vault_id: '649382071', first_name: 'Nico', last_name: 'Glennon', phone: '+17739309398', email: 'nicoglennon@icloud.com')
josh = Customer.create(username: 'jmharvey0', password: 'password', vault_id: '601241421', first_name: 'Josh', last_name: 'Harvey', phone: '+13121234560', email: 'josh@josh.com')

1000.times do
  Customer.create(username: Faker::Internet.user_name, password: 'password', vault_id: '601241421', first_name: 'Josh', last_name: 'Harvey', phone: '+13121234561', email: Faker::Internet.safe_email)
end

dugans = Business.create(username: 'dugans_on_halsted', password: 'password', sub_merchant_id: 'braintreesecret0', email: 'dugans@dugans.com', doing_business_as: 'Dugans')
sliperyslope = Business.create(username: 'sliperyslope', password: 'password', sub_merchant_id: 'braintreesecret1', email: 'slipery@slope.com', doing_business_as: 'Slippery Slope')
emporium = Business.create(username: 'emporium', password: 'password', sub_merchant_id: 'braintreesecret2', email: 'emporium@emporium.com', doing_business_as: 'Emporium')
mullens = Business.create(username: 'mullens_wheaton', password: 'password', sub_merchant_id: 'braintreesecret3', email: 'mullens@mullens.com', doing_business_as: 'Wheaton Mullens')

customers = Customer.all
businesses = [dugans, sliperyslope, emporium, mullens]
drink_types = ['Shot/Liqour', 'Beer', 'Wine', 'Cocktail']

def rand_in_range(from, to)
  rand * (to - from) + from
end

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

100.times do
  Tab.create(customer: customers.sample, business: businesses.sample, created_at: rand_time(6.hours.ago))
end

100.times do
  Tab.create(customer: customers.sample, business: businesses.sample, created_at: rand_time(2.days.ago))
end

100.times do
  Tab.create(customer: customers.sample, business: businesses.sample, created_at: rand_time(5.days.ago))
end

100.times do
  Tab.create(customer: customers.sample, business: businesses.sample, created_at: rand_time(30.days.ago))
end

200.times do
  Tab.create(customer: customers.sample, business: businesses.sample, created_at: rand_time(3.months.ago))
end

tabs = Tab.all

1200.times do
  Item.create(drink_type: drink_types.sample, price: rand(1..10)*100, tab: tabs.sample)
end
