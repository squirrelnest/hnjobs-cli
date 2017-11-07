class HnjobsController

# User Flow: First-Timer
# 1. user installs gem
# 2. user starts app
# 3. CLI says hi and provides instructions
# 4. user inputs list command
# 5. CLI shows error message that there is no list yet, please scrape first
# 5. user inputs url to scrape
# 5. CLI scrapes url
# 6. CLI outputs list
# 7. user inputs number of job posting
# 8. CLI outputs further details about job posting
# 9. user returns to list via #list
# 10. user filters list by #search
# 11. user inputs number of job posting
# 12. CLI outputs further details about job posting
# 13. user exits

  def call
    greeting
    url = gets.to_s.strip
    if url != 'exit'
      puts 'Scraping...'
      jobs = Scraper.new(url)
      jobs
      # jobs = scraper.scrape(input)
      # jobs.each_with_index do |job, i|
      #   item = Job.new(job)
      #   puts `#{i}. #{item.firstline}`
      # end
      menu
    end
  end

  def greeting
    puts "Hello! Welcome to the Hacker News Job Scraper."
    puts "I can distill an 'Ask HN: Who is hiring?' post down to its fine job postings, minus the cacophony of replies to each comment"
    puts "Input URL to scrape:"
  end

  def menu
    puts "Available Commands:"
    puts "Enter the number of a job posting to see its details"
    puts "scrape <url_of_hacker_news_post>    //--> scrapes a new url and outputs another list of job postings"
    puts "list                                //--> list job postings from latest scrape"
    puts "filter <search terms>               //--> filter job postings by search terms"
  end

end
