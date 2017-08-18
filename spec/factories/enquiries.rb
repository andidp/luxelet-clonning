FactoryGirl.define do
  factory :enquiry do
    property nil
    checkin "2017-07-18 12:52:47"
    checkout "2017-07-18 12:52:47"
    reserved_at "2017-07-18 12:52:47"
    booked_at "2017-07-18 12:52:47"
    expired_at "2017-07-18 12:52:47"
    completed_at "2017-07-18 12:52:47"
    reference_number "MyString"
    number_of_adults 1
    number_of_children 1
    number_of_infants 1
    total_cost "9.99"
    tax "9.99"
    currency "MyString"
    user nil
  end
end
