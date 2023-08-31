# Bugzilla Application

This README provides information about the Bugzilla application, including setup, usage, and deployment instructions.

## Ruby Version

This application is built using Ruby on Rails. The recommended Ruby version is 2.3.3. You can check the Ruby version specified in the `Gemfile`.

## System Dependencies

- Ruby
- Ruby on Rails


## Configuration

1. Clone the repository: `git clone [repository_url]`
2. Install required gems: `bundle install`
3. Configure your database in `config/database.yml`

## Database Setup

1. Create the database: `rails db:create`
2. Run database migrations: `rails db:migrate`
3. Optionally, seed the database with initial data: `rails db:seed`

## Running the Application

1. Start the Rails server: `rails server`
2. Access the application in your browser at `http://localhost:3000`

## Running Tests

To run the test suite, use the following command:
```sh
rails test
