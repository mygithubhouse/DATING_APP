FactoryBot.define do
  factory :account, class: "AccountBlock::Account" do
    full_name { 'Faker::Name.name' }
    email {Faker::Internet.email}
    password_digest {"password"}
  end
end