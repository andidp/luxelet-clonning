json.extract! enquiry, :id, :property_id, :checkin, :checkout, :number_of_adults, :number_of_children, :number_of_infants, :user_id, :created_at, :updated_at
json.url enquiry_url(enquiry, format: :json)
