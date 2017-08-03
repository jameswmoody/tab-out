# THIS SEED FILE DESTROYS EVERYTHING!!!!!

Item.delete_all
Tab.delete_all
Customer.delete_all
Business.delete_all

james = Customer.create(username: 'jameswmoody', password: 'password', vault_id: '203106301', first_name: 'James', last_name: 'Moody', phone: '+12482272481', email: 'james@james.com')
evan = Customer.create(username: 'ehickle', password: 'password', vault_id: '699547769', first_name: 'Evan', last_name: 'Hickle', phone: '+12607979836', email: 'evan@evan.com')
nico = Customer.create(username: 'nicoglennon', password: 'password', vault_id: '649382071', first_name: 'Nico', last_name: 'Glennon', phone: '+17739309398', email: 'nicoglennon@icloud.com')
josh = Customer.create(username: 'jmharvey0', password: 'password', vault_id: '601241421', first_name: 'Josh', last_name: 'Harvey', phone: '+16308800232', email: 'josh@josh.com')

1000.times do
  Customer.create(username: Faker::Internet.user_name, password: 'password', vault_id: '601241421', first_name: 'Josh', last_name: 'Harvey', phone: '+13121234561', email: Faker::Internet.safe_email)
end

dugans = Business.create(username: 'dugansonhalsted', password: 'password', sub_merchant_id: 'braintreesecret0', email: 'dugans@dugans.com', doing_business_as: 'Dugans')
sliperyslope = Business.create(username: 'sliperyslope', password: 'password', sub_merchant_id: 'braintreesecret1', email: 'slipery@slope.com', doing_business_as: 'Slippery Slope')
emporium = Business.create(username: 'emporium', password: 'password', sub_merchant_id: 'braintreesecret2', email: 'emporium@emporium.com', doing_business_as: 'Emporium')
mullens = Business.create(username: 'mullenswheaton', password: 'password', sub_merchant_id: 'braintreesecret3', email: 'mullens@mullens.com', doing_business_as: 'Wheaton Mullens')

customers = Customer.all
businesses = [dugans, sliperyslope, emporium, mullens]
drink_types = ['Shot/Liqour', 'Beer', 'Wine', 'Cocktail']

def rand_in_range(from, to)
  rand * (to - from) + from
end

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

4.times do
  Tab.create(customer: customers.sample, business: emporium, tip: 234, transaction_id: 'acb123', created_at: rand_time(12.hours.ago))
end

2.times do
  Tab.create(customer: customers.sample, business: emporium, created_at: rand_time(12.hours.ago))
end

900.times do
  Tab.create(customer: customers.sample, business: businesses.sample, tip: 234, transaction_id: 'acb123', created_at: rand_time(1.month.ago))
end

100.times do
  Tab.create(customer: customers.sample, business: businesses.sample, created_at: rand_time(1.month.ago))
end

3000.times do
  Item.create(drink_type: drink_types.sample, price: rand(8..14)*100, tab: Tab.all.sample)
end
