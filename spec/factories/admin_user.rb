
FactoryBot.define do
  factory :admin_user, class: 'AdminUser' do
    email { "te#{rand(100_000..999_999)}@mailinator.com" }
    password { 'Password' }
    password_confirmation { 'Password' }
  end
end