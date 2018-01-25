class User
  attr_reader :id

  def initialize
    self.id = SecureRandom.uuid
  end
end
