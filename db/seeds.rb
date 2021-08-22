# frozen_string_literal: true

Customer.create(first_name: 'Johny', last_name: 'Flow')
Customer.create(first_name: 'Raj', last_name: 'Jamnis')
Customer.create(first_name: 'Andrew', last_name: 'Chung')
Customer.create(first_name: 'Mike', last_name: 'Smith')

# successful transactions
5.times do
  Customer.first.transactions << Transaction.create(created: Time.now.to_i, amount: Random.rand(100..9900),
                                                    refunded: false, paid: true)
end
3.times do
  Customer.second.transactions << Transaction.create(created: Time.now.to_i, amount: Random.rand(100..9900),
                                                     refunded: false, paid: true)
end
Customer.third.transactions << Transaction.create(created: Time.now.to_i, amount: Random.rand(100..9900),
                                                  refunded: false, paid: true)
Customer.fourth.transactions << Transaction.create(created: Time.now.to_i, amount: Random.rand(100..9900),
                                                   refunded: false, paid: true)

# failed transactions
3.times do
  Customer.third.transactions << Transaction.create(created: Time.now.to_i, amount: Random.rand(100..9900),
                                                    refunded: false, paid: false)
end
2.times do
  Customer.fourth.transactions << Transaction.create(created: Time.now.to_i, amount: Random.rand(100..9900),
                                                     refunded: false, paid: false)
end

# disputed transactions
3.times do
  Customer.first.transactions << Transaction.create(created: Time.now.to_i, amount: Random.rand(100..9900),
                                                    refunded: true, paid: true)
end
2.times do
  Customer.second.transactions << Transaction.create(created: Time.now.to_i, amount: Random.rand(100..9900),
                                                     refunded: true, paid: true)
end
