# Partner
1.upto(5).each do |partner|
  Partner.create(
    email: Faker::Internet.email,
    full_name: Faker::StarWars.planet,
    password: 'password',
  )
end
# # Customer
1.upto(15).each do |customer|
  Customer.create(
    email: "#{customer}#{Faker::Internet.email}",
    full_name: Faker::StarWars.character,
    password: 'password',
  )
end
# # Property
1.upto(50).each do |property|
  Property.create(
    name: Faker::Hobbit.location,
    description: Faker::Lorem.paragraph,
    searchable: true,
    cost: Random.new.rand(200..5000),
    tax: Random.new.rand(0..100),
    currency: "USD",
    user_id: Partner.ids.sample,
    created_at: Time.now,
    updated_at: Time.now
  )
end
# # Enquiry
1.upto(25).each do |enquiry|
  checkin = Faker::Time.forward(Random.new.rand(1..160), :morning)
  Enquiry.create(
    property_id: Property.ids.sample,
    checkin: checkin,
    checkout: checkin+Random.new.rand(3..7).days,
    reserved_at: checkin,
    booked_at: [checkin, nil].sample,
    expired_at: nil,
    completed_at: nil,
    reference_number: SecureRandom.hex(3).upcase,
    number_of_adults: Random.new.rand(1..3),
    number_of_children: Random.new.rand(0..2),
    number_of_infants: Random.new.rand(0..1),
    total_cost: Random.new.rand(200..5000),
    tax: Random.new.rand(0..100),
    currency: "USD",
    user_id: Customer.ids.sample,
    created_at: Time.now,
    updated_at: Time.now
  )
end
# # Message
1.upto(50).each do |message|
  enquiry_id = Enquiry.ids.sample
  enquiry = Enquiry.find(enquiry_id)
  Message.create(
    enquiry_id: enquiry_id,
    from: Customer.find(Customer.ids.sample).email,
    to: Partner.find(Partner.ids.sample).email,
    subject: "Re: [#{enquiry.reference_number}] Enquiry #{enquiry.property} for #{enquiry.user}",
    body: Faker::Internet,
    message_at: Faker::Time.backward(Random.new.rand(1..40), :morning)
  )
end
# # Payment
1.upto(15).each do |payment|
  enquiry_id = Enquiry.ids.sample
  enquiry = Enquiry.find(enquiry_id)
  Payment.create(
    enquiry_id: enquiry_id,
    amount: (enquiry.total_cost/Random.new.rand(1..3)),
    currency: "USD",
    payment_at: Faker::Time.backward(Random.new.rand(1..30), :morning)
  )
end
