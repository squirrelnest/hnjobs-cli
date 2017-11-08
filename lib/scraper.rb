require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  attr_accessor :doc

  def initialize(url)
    # Assign nokogiri output to variable
    @doc = Nokogiri::HTML(open(url))
  end

  def self.scrape(url)
    @doc = Nokogiri::HTML(open(url))
    puts "#{@doc.css(".comment").length} job postings found"
    puts ""
    @doc.css(".comment").map do |comment|
      puts comment.css(".c00").first.text unless comment.css(".c00").first === nil
    end
  end

  # Create jobs

  # Search doc to populate jobs hash

end
