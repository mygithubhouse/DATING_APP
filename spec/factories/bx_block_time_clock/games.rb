FactoryBot.define do
  factory :game, class: 'BxBlockTimeClock::Game' do
    start_at {Time.now}
    end_at {Time.now + 24.hours}
  end
end
