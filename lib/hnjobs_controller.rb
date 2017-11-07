class HnjobsController

# User Flow: First-Timer
# 1. user installs gem
# 2. user starts app
# 3. CLI says hi and provides instructions
# 4. user inputs list command
# 5. CLI shows error message that there is no list yet, please scrape first
# 5. user inputs #scrape(url)
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
    puts "Hello World"
  end

end
