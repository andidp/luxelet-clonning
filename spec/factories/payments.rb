FactoryGirl.define do
  factory :payment do
    enquiry nil
    amount "9.99"
    currency "MyString"
    payment_at "2017-07-18 12:59:15"
  end
end
