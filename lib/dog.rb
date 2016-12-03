class Dog

  attr_reader :name, :species
  attr_writer
  attr_accessor :owner, :mood

  def initialize(name)
    @name = name
    @species = "dogs"
    @mood = "nervous"
  end

  def owner_name=(owner_object)
    self.owner = owner_object
    owner.add_pet(self)
  end

end