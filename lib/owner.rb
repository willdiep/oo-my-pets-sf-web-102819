class Owner
  attr_reader :name, :species
  attr_accessor :cats

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select { |cat| cat.owner == self}
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    self.dogs.each do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end

    self.cats.each do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end

  end
  
  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end


end