require 'pry'

class Owner

  attr_reader :species
  attr_writer
  attr_accessor :pets, :add_pet, :name


  @@owners = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {fishes: [], cats: [], dogs: []}
    @@owners << self
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    new_fish.owner_name = self
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    new_cat.owner_name = self
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    new_dog.owner_name = self
  end

  def add_pet(pet)
    pets[pet.species.to_sym].push(pet)
  end

  def say_species
    "I am a #{self.species}."
  end

  def walk_dogs
    pets[:dogs].each { |dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].each { |cat| cat.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].each { |fish| fish.mood = "happy"}
  end

  def sell_pets
    pets[:dogs].each { |dog| dog.mood = "nervous"}
    pets[:cats].each { |cat| cat.mood = "nervous"}
    pets[:fishes].each { |fish| fish.mood = "nervous"}
    pets[:dogs].clear
    pets[:cats].clear
    pets[:fishes].clear
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

  def self.all
    @@owners
  end

  def self.reset_all
    all.clear
  end

  def self.count
    @@owners.count
  end

end