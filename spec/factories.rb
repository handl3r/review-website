FactoryBot.define do
  # users set
  factory :user1, class: User do
    email { 'test1@gmail.com' }
    role  { 'Company' }
    password { '111111' }
    password_confirmation { '111111' }
  end
  factory :user2, class: User do
    email { 'test2@gmail.com' }
    role { 'Reviewer'}
    password { '111111' }
    password_confirmation { '111111' }
  end
  # places set
  factory :place1, class: Place do
    address { 'xxx'}
    numberRatings { 0 }
    mediumRating { 0 }
    phoneNumber { '000-000-0000' }
    timeOpen { Faker::Time.between(2.days.ago, Date.today, :all) }
    timeClose { Faker::Time.between(2.days.ago, Date.today, :all) }
    description {'d' * 21}
    user1
    association service
  end
  # photos set
  factory :photo1, class: Photo do
    photo_type
    path
    user1
    place1
  end
  # services set
  factory :service1, class: Service do
    name
  end
  factory :service2, class: Service do
    name
  end
  factory :service3, class: Service do
    name
  end
  factory :service4, class: Service do
    name
  end
  factory :service5, class: Service do
    name
  end

end
