FactoryGirl.define do
  factory :message do
    enquiry nil
    from "MyString"
    to "MyString"
    subject "MyString"
    body "MyText"
    message_at "2017-07-18 12:57:45"
  end
end
