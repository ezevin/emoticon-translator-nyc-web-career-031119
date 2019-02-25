# require modules here
require "yaml"
require 'pry'
emoticons = YAML.load_file("./lib/emoticons.yml")
puts emoticons.inspect


def load_library(library)
  # code goes here
  
emoticons = YAML.load_file("./lib/emoticons.yml")
   
  library = {}
  library["get_emoticon"] ||= {}
  library["get_meaning"] ||= {}

  emoticons.each do |meaning, value|

  english_emoticon = value.first 
  japanese_emoticon = value.last

  library["get_emoticon"][english_emoticon] = japanese_emoticon
  library["get_meaning"][japanese_emoticon] = meaning

  end 
library
end

def get_japanese_emoticon(library, emoticons)
  # code goes here
  hash = load_library(library)
  hash.each do |get_ , emoticon_hash|
    emoticon_hash.each do |english, japanese|
 binding.pry
      if emoticon_hash.include?(emoticons)
        return japanese
      else return "Sorry, that emoticon was not found"
      end 
    end 
  end 
end

def get_english_meaning(library, emoticons)
  # code goes here
  hash = load_library(library)
  hash.each do |get_ , emoticon_hash|
    emoticon_hash.each do |japanese, meaning|
      if get_ == "get_meaning" && emoticons == japanese
        return meaning
    
      end 
    end 
  end 
end