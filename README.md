# Addresses API
## Dependencies
* Rails 5.0.2
* Ruby 2.3.1
* PG 0.18

## Development

Copy repository and install dependencies with:

```sh
bundle install
```

Start PostgreSQL server and initialize Database with:

```sh
rake db:create
rake db:migrate
```

Set geocoding and geoelevation api keys

```sh
export GEOCODE_APIKEY = "your_geocode_apikey"
export GEOELEVATION_APIKEY = "your_geoelevation_apikey"
```

Start server with

```sh
rails server
```

## Usage

Base url: https://addresses-api.herokuapp.com

### POST Address

```
POST /api/addresses/
```

- Request:
  - Headers: 
    - Content-Type: application/json
  - Body:
    - address: 
  
- Response:
  - status: OK
  - address: 
    - id
    - name
    - latitude
    - longitude
    - elevation
  
### GET Addresses/:id

```
GET /api/addresses/:id
```

- Response:
  - status
  - address: 
    - id
    - name
    - latitude
    - longitude
    - elevation
    
### GET Addresses

```
GET /api/addresses/
```

- Response:
  - status
  - address: collection of addresses

## Testing

Run the tests with:

```sh
rails test test/models/address_test.rb
```

## Bibliography

* API: [link](http://edgeguides.rubyonrails.org/api_app.html) 
* PostgreSQL: [link](https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres) 
