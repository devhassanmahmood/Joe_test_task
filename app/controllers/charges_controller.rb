# frozen_string_literal: true

class ChargesController < ApplicationController
  def index
    @successful = Transaction.successful
    @failed = Transaction.failed
    @disputed = Transaction.disputed
  end
end
