require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    #binding.pry
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end



  def execute_transaction
    if valid? && @status == "pending"
      if @amount < @sender.balance
        @receiver.balance += @amount
        @sender.balance -= @amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

    def reverse_transfer
      if @status == "complete"
        @receiver.balance -= @amount
        @sender.balance += amount
        @status = "reversed"
      end
  end



end
