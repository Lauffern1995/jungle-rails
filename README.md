# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

##


!['SHOW_HOME'](https://github.com/Lauffern1995/jungle-rails/blob/master/docs/Show_Home.gif?raw=true)

!["ADD TO CART"](https://github.com/Lauffern1995/jungle-rails/blob/master/docs/Add_to_cart.gif?raw=true)

!["PAY"](https://github.com/Lauffern1995/jungle-rails/blob/master/docs/Pay.gif?raw=true)


!["COMPLETE_PAY"](https://github.com/Lauffern1995/jungle-rails/blob/master/docs/Complete_payment.gif?raw=true)

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


## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
