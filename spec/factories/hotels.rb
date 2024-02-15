FactoryBot.define do
  factory :hotel do

    name { Faker::Name.name_with_middle}
    email {Faker::Internet.email}
    contact_number {Faker::PhoneNumber.cell_phone_with_country_code}
    address { ' Indore, India' }
    description {' lorem span' }
    
  end
end
