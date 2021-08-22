# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :customer
  before_save :set_created

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }
  scope :failed, -> { where(paid: false) }

  def amount
    self[:amount] / 100.0
  end

  def created
    Time.at(self[:created]).strftime('%Y-%m-%d')
  end

  private

  def set_created
    self.created = DateTime.current.to_i
  end
end
