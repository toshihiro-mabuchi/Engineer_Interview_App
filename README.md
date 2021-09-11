# Genkinomoto1 
This is a Web Application Development Project.

## How to set up Rails Application with Docker

### Initial directory and files
#### Root directory
- Dockerfile # As it is.
- docker-compose.yml # As it is.
- Gemfile  # Only Rails 6.1.4 is specified, otherwise no gem is included initially. 
- Gemfile.lock # This must be empty.
- entrypoint.sh # As it is.

1. $ docker-compose run web rails new . --force --no-deps --database=postgresql --skip-test --webpacker
2. Modifying "database.yml" to the current one
3. $ docker-compose run web rails db:create
4. $ docker-compose up -d
5. http://localhost:3000/

## References
https://qiita.com/mk_0409/items/069e05ed1b00ab7d4a94