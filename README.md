# hnjobs-cli

This handy dandy CLI app scrapes Hacker News for job postings. It outputs a list of jobs as well as further details about individual jobs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hnjobs_cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hnjobs_cli

## Usage

1) Google for the latest Hacker News post on who is hiring. Suggested keywords: "Ask HN: Who is hiring (<month> <year>)"

2) Copy the post URL, which should look something like this: https://news.ycombinator.com/item?id=15601729, except the id will change from post to post.

3) Paste the URL into the command line and press Enter.

4) hnjobs-cli will scrape the page and output a list of jobs. Enter the number of a job to see further details about that job.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/squirrelnest/hnjobs-cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the hnjobs-cli project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/squirrelnest/hnjobs-cli/blob/master/CODE_OF_CONDUCT.md).
