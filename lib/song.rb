require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    @name = name
    song.name = @name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    @name = name
    song.name = @name
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    song_check = self.find_by_name(name) 
    song_check ? song_check : self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name }
  end
  
  def self.new_from_filename(file)
    no_ext = file.sub /\....$/, ''
    info = no_ext.split(" - ")
    
    song = self.new
    @artist_name = info[0]
    @name = info[1]
    song.artist_name = @artist_name
    song.name = @name
    song
  end
  
  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end
  
  def self.destroy_all
    self.all.clear
  end
end
