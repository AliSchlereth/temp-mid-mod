FactoryGirl.define do
  factory :user do
    first_name "FirstName"
    last_name "LastName"
    email "name@email.com"
    password_digest "password"
  end
end
