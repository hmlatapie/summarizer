# Summarizer

Sumarize online pdf documents using GPT-3 model from the openai api.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'summarizer'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install summarizer

## Usage

Before you can use the gem, you need to export the `OPENAI_ACCESS_TOKEN` environment variable. The access token is available on the [OpenAI API page](https://openai.com/api/).

```bash
export OPENAI_ACCESS_TOKEN=<your-access-token>
```

Then you can use the gem:

```ruby
  Summarizer.summarize('https://www.example.com/some-pdf-document.pdf')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/3zcurdia/summarizer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/3zcurdia/summarizer/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Summarizer project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/3zcurdia/summarizer/blob/main/CODE_OF_CONDUCT.md).
