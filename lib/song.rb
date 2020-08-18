require'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create #constructor
    song = Song.new
    song.save
    song
  end
  
  def self.new_by_name(name) #constructor
    song = Song.new
    song.name = name 
    song.save
    song 
  end  
  
  def self.create_by_name(name) #constructor
    Song.new_by_name(name)
  end   
  
  def self.find_by_name(name)
    @@all.detect{|i| i.name == name}
  end   
  
  def self.find_or_create_by_name(name)
    
    self.find_by_name(name) || self.create_by_name(name)
  end   
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end   
  
  def self.new_from_filename(filename)
    
    data = filename.split(/[-.]/)
    edited_data = data.map {|i| i.strip}
    
    artist_name = edited_data[0]
    name = edited_data[1]
    
    new_song = self.create_by_name(name)
    new_song.artist_name = artist_name
    
    new_song
  end   
  
  
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
end