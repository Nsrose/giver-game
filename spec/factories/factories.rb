require 'factory_girl'

FactoryGirl.define do
  factory :giving_game do
    title 'A Fake Title' # default values
    description 'A giving game that does something'
    total_money 10.00
    per_transaction 1.00
    created_at { 10.years.ago }
    updated_at { 2.years.ago }
    charity_a_id 1
    votesA 0
    charity_b_id 2
    votesB 0
  end
end

FactoryGirl.define do
  factory :user do
    email { "fake@fake.com" }
    username "FAKER"
    password "password"
    password_confirmation "password"
  end
end

FactoryGirl.define do
  factory :charity do
    name 'Against Malaria Foundation'
    description "Description"
    ein '20-3069841'
    image_link 'https://www.againstmalaria.com/images/logo_AMF.gif'
    homepage_link 'https://www.againstmalaria.com/Default.aspx'
    donation_link 'https://www.againstmalaria.com/donate.aspx?GroupID=81'
  end
end
