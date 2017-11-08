class HnjobsController

# User Flow: First-Timer
# 1. user installs gem
# 2. user starts app
# 3. CLI says hi and provides instructions
# 4. user inputs url to scrape or uses default url
# 5. CLI scrapes url
# 6. CLI outputs list
# 7. user inputs number of job posting
# 8. CLI outputs further details about job posting
# 9. user returns to list via #list
# 10. user filters list by #filter
# 11. user scrapes new page via #scrape
# 12. user exits

  # User interface
  def call
    puts greeting
    scrape
    input = ''
    while input != 'exit'
      input = gets.strip
      case input
      when -> (input) { input.to_i != 0 } # this proc lets you make comparisons inside case statements
        job = Job.find_by_id(input.to_i)
        if job
          puts "\n\n" + job.description + "\n\n"
          puts menu
        else
          puts "Out of range. Please input a number between 1 and #{Job.count}"
        end
      when 'list'
        list
      when 'exit'
        puts "\n\nGoodbye!\n\n"
      when 'scrape'
        scrape
      when 'filter'
        filter
        puts "\n\nEnter the number of a job posting to see more info."
      else
        puts 'Unknown command'
        puts menu
      end
    end
  end

  # List jobs with numbers for reference
  def list
    puts "\n\n#{Job.count} job postings found\n\n"
    Job.list.map do |job|
      puts "#{job.id}. #{job.firstline}"
    end
    puts "\n\nEnter the number of a job posting to see more info."
  end

  # Scrape page and create jobs
  def scrape
    Job.reset
    puts 'Enter a URL to scrape (or press enter for default):'
    url = gets.strip
    url = 'https://news.ycombinator.com/item?id=15601729' if url == ''
    puts "Scraping...\n\n"
    jobs_data = Scraper.scrape(url)
    jobs_data.each_with_index do |job_data, i|
      job = Job.new(job_data.merge(id: i+1))
    end
    puts list
  end

  # Filter jobs
  def filter
    puts 'Enter keyword:'
    keyword = gets.strip
    Job.filter(keyword).each do |job|
      puts "#{job.id} #{job.firstline}"
    end
  end

  def greeting
    <<~EOL
      Hello! Welcome to the Hacker News Job Scraper.
      I can distill an 'Ask HN: Who is hiring?' post down to its fine job postings.
      Input URL to scrape:
    EOL
  end

  def menu
    <<~EOL
      Available Commands:
      Enter the number of a job posting to see its details
      scrape                              //--> scrapes a new url and outputs another list of job postings
      list                                //--> list job postings from latest scrape
      filter                              //--> filter job postings by search terms
      exit                                //--> exit the program
    EOL
  end

end
