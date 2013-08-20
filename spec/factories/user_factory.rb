require 'factory_girl'

FactoryGirl.define do
  factory :user1, :class => User do
    name 'amar'
    email "abc@gmail.com"
    password "foobar123"
    password_confirmation "foobar123"
    confirmed_at Date.today
  end

  factory :user2, :class => User do
    name 'singh'
    email "def@gmail.com"
    password "foobar123"
    password_confirmation "foobar123"
    confirmed_at Date.today
  end

end