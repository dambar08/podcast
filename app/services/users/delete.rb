module Users
  class Delete
    def self.call(...)
      new(...).call
    end

    def initialize(user)
      @user = user
    end

    def call
      user.purge
    end

    private

    attr_reader :user
  end
end
