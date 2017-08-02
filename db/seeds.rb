# THIS SEED FILE DESTROYS EVERYTHING!!!!!

Item.delete_all
Tab.delete_all
Customer.delete_all
Business.delete_all

james = Customer.create(username: 'jameswmoody', password: 'password', vault_id: '203106301', first_name: 'James', last_name: 'Moody', phone: '+12482272481', email: 'james@james.com')
evan = Customer.create(username: 'ehickle', password: 'password', vault_id: '699547769', first_name: 'Evan', last_name: 'Hickle', phone: '+12607979836', email: 'evan@evan.com')
nico = Customer.create(username: 'nicoglennon', password: 'password', vault_id: '649382071', first_name: 'Nico', last_name: 'Glennon', phone: '+17739309398', email: 'nicoglennon@icloud.com')
josh = Customer.create(username: 'jmharvey0', password: 'password', vault_id: '601241421', first_name: 'Josh', last_name: 'Harvey', phone: '+13121234560', email: 'josh@josh.com')
guest = Customer.create(username: 'guest', password: 'password', vault_id: '601241421', first_name: 'Guest', last_name: 'User', phone: '+10000000000', email: 'guest@guest.com')

dugans = Business.create(username: 'dugansonhalsted', password: 'password', sub_merchant_id: 'braintreesecret0', email: 'dugans@dugans.com', doing_business_as: 'Dugans')
sliperyslope = Business.create(username: 'sliperyslope', password: 'password', sub_merchant_id: 'braintreesecret1', email: 'slipery@slope.com', doing_business_as: 'Slippery Slope')
emporium = Business.create(username: 'emporium', password: 'password', sub_merchant_id: 'braintreesecret2', email: 'emporium@emporium.com', doing_business_as: 'Emporium')
mullens = Business.create(username: 'mullenswheaton', password: 'password', sub_merchant_id: 'braintreesecret3', email: 'mullens@mullens.com', doing_business_as: 'Wheaton Mullens')

# customers = [james, evan, nico, josh]
# businesses = [dugans, sliperyslope, emporium, mullens]
# drink_types = ['Shot/Liqour', 'Beer', 'Wine', 'Cocktail']

# 20.times do
#   Tab.create(customer: customers.sample, business: businesses.sample)
# end

# tabs = Tab.all

# 60.times do
#   Item.create(drink_type: drink_types.sample, price: rand(1..10)*100, tab: tabs.sample)
# end
