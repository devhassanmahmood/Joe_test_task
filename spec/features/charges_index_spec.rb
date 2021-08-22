# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'charges/index', type: :feature do
  before do
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    customer_3 = create(:customer)
    customer_4 = create(:customer)

    5.times { create(:transaction, paid: true, refunded: false, customer: customer_1) }
    3.times { create(:transaction, refunded: false, paid: true, customer: customer_2) }
    create(:transaction, refunded: false, paid: true, customer: customer_3)
    create(:transaction, refunded: false, paid: true, customer: customer_4)

    3.times { create(:transaction, paid: false, refunded: false, customer: customer_1) }
    2.times { create(:transaction, paid: false, refunded: false, customer: customer_4) }

    3.times { create(:transaction, paid: true, refunded: true, customer: customer_1) }
    2.times { create(:transaction, paid: true, refunded: true, customer: customer_2) }

    visit charges_path
  end

  scenario 'displays Failed Charges' do
    expect(page).to have_text('Failed Charges')
  end

  scenario 'displays Disputed Charges' do
    expect(page).to have_text('Disputed Charges')
  end

  scenario 'displays Successful Charges' do
    expect(page).to have_text('Successful Charges')
  end

  scenario 'has 10 Successful Charges' do
    within('tbody.successful') do
      expect(page).to have_selector('tr', count: 10)
    end
  end

  scenario 'has 5 Failed Charges' do
    within('tbody.failed') do
      expect(page).to have_selector('tr', count: 5)
    end
  end

  scenario 'has 5 Disputed Charges' do
    within('tbody.disputed') do
      expect(page).to have_selector('tr', count: 5)
    end
  end
end
