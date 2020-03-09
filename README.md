# Jdbc::Mssql

This Ruby gem loads the Microsoft SQL Server JDBC driver.
Install this gem and `require 'jdbc/mssql'` within JRuby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jdbc-mssql'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jdbc-mssql

## Usage

This is a very minimal and basic sample.

```ruby
require 'jdbc/mssql'

connection_string = [
  'jdbc:sqlserver://192.168.1.3:1433',
  'database=sample_development',
  'user=sa',
  'password=sa_password'
].join(';')

connection = java.sql.DriverManager.getConnection(connection_string)

statement = connection.createStatement

sql_query = 'SELECT * FROM types'

result = statement.executeQuery(sql_query)

while result.next
  puts [result.getString(1), result.getString(2), result.getString(3)]
end
```

For more details follow Microsoft's documentation and JRuby conventions to call java methods.

## Supported Java versions

For supported Java version use Gem versions as per below table:

| Java version | Gem version   | used driver |
| ------------ | ------------- | ----------- |
| 8            | 0.8.0         | 8.2.1       |
| 11           | 0.8.0         | 8.2.1       |

## Other Java versions

For other Java version use Gem versions as per below table:

| Java version | Gem version   | used driver |
| ------------ | ------------- | ----------- |
| 7            | 0.6.0         | 6.4.0       |
| 9            | 0.6.0         | 6.4.0       |
| 10           | 0.6.0         | 7.0.0       |
| 12           | 0.7.0         | 7.4.1       |
| 13           | 0.8.0         | 8.2.1       |

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jdbc-mssql. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jdbc::Mssql project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/jdbc-mssql/blob/master/CODE_OF_CONDUCT.md).
