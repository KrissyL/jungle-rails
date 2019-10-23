# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. As an introduction to Ruby and Rails, this project enabled me to get used to the Rails generator feature and also getting practice writing Ruby code.

## Testing
The main focus of this app for me was to become familiar with writing tests. 

## Screenshots
These are some examples of my final product.
!['The landing page that you see when starting up the server'](https://github.com/KrissyL/jungle-rails/blob/master/docs/home-page.png)
!['The product details page that you see when you click on a specific product'](https://github.com/KrissyL/jungle-rails/blob/master/docs/product-details.png)
!['the amin authentication that pops up when you try to access the admin dashboard'](https://github.com/KrissyL/jungle-rails/blob/master/docs/admin-auth.png)
!['the cart view when products are added'](https://github.com/KrissyL/jungle-rails/blob/master/docs/cart.png)
!['user name is visible when successfully signed in'](https://github.com/KrissyL/jungle-rails/blob/master/docs/signed-in.png)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
