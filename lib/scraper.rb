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
    @doc.css(".reply").remove
    @doc.css(".comment").each_with_index.map do |comment, i|
      id = i
      unless comment.css(".c00").first === nil || comment.css(".c00").first === "" || !comment.css(".c00").first.to_s.include?('|') || comment.css(".c00").first.to_s.split("|").first.length > 150
        company = comment.css(".c00").first.to_s.split("|").first.gsub(/<span class="c00">|<p>*|<a.*a>/, '').strip
        firstline = comment.css(".c00").first.to_s.match(/.*\|*<p>/).to_s.gsub(/<span class="c00">|<p>*|<a.*a>/, '').strip
        description = comment.css(":not(p)").first.text.strip
      end
      job_data = { company: company, firstline: firstline, description: description }
      job_data unless company === nil || company === ""
    end.compact
  end

  # Create jobs

  # Search doc to populate jobs hash

end
