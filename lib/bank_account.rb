class BankAccount

    @@all = []

    attr_reader :name, :balance, :status
    attr_writer :balance, :status

    def self.all
        @@all
    end

    def initialize(name)
        @name=name
        @balance = 1000
        @status='open'
    end

    def valid?
        @status == 'open' && self.not_broke?
    end

    def not_broke?
        @balance>0
    end

    def close_account
        @status='closed'
    end

    def deposit(amount)
        @balance+=amount
    end

    def display_balance
        "Your balance is $#{balance}."
    end

end
