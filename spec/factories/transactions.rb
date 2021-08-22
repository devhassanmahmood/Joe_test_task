# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    paid { Faker::Boolean }
    amount { Faker::Number.decimal(l_digits: 4) }
    currency { 'USD' }
    refunded { Faker::Boolean }
  end
end
