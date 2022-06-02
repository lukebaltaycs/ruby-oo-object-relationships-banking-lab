class Transfer
  
  @@all=[]

  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status='pending'
    @@all<<self
  end

  def self.all
    @@all
  end

  def valid?
    self.sender.valid?&&self.receiver.valid?&&self.status=='pending'
  end

  def execute_transaction()
    if self.valid? && self.transaction_valid?(self.sender, self.amount)
      self.sender.balance-= self.amount
      self.receiver.balance+=self.amount
      self.status='complete' 
    else
      self.status='rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status=='complete'
      self.sender.balance+= self.amount
      self.receiver.balance-=self.amount
      self.status='reversed'
    end
  end


  def transaction_valid?(sender, amount)
    sender.balance >= amount
  end



end
