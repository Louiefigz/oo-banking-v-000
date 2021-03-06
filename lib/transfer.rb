require 'pry'
class Transfer

  attr_accessor :status, :amount, :receiver, :sender
    
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 

  def both_valid?
   sender.valid? && receiver.valid? ? true : false 
  end 


  def execute_transaction
    
    if self.status != "complete" && both_valid? && sender.balance > amount 
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end 
  end

  def reject_transfer
    self.status = "rejected"
      "Transaction rejected. Please check your account balance."
  end 

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount 
      receiver.balance -= amount
      self.status = "reversed"
    end 
  end 


end