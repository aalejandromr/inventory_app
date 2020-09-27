# README

Welcome to my ruby on rails inventory app.

The purpose of this inventory app is to showcase my ability to build a functional app in a short amount of time (less than 1 day), Let's beging with some prep.

(This guide expect you to have the following ruby version installed)

* Ruby version
  * ruby '2.6.5'

## Primary gems list
  * Ruby on Rails ~> 6.0.3
  * Rails admin (Dashboard to for the inventory CRUD operations)
  * devise for authetification
  * cancan for authorization
  * tailwindcss
  * Stripe for payments
  * Active Storage to store product's image

## Relationships

  Product has one inventory.
  Inventory belongs to Product.
  User just holds the user role and the devise's authentification, we do not record purchases at this time.

## Configuration

I used sqlLite so you should not need to configure database
You will need a Stripe token to be able to use the legacy payments and finish the process of checkout.
* ENV['PUBLISHABLE_KEY']
* ENV['SECRET_KEY']
  * However, Stripe documentation have stated you can use the following `rails s` command to save you time and test the integration
    `PUBLISHABLE_KEY=pk_test_TYooMQauvdEDq54NiTphI7jx SECRET_KEY=sk_test_4eC39HqLyjWDarjtT1zdp7dc rails s` [Docs here](https://stripe.com/docs/legacy-checkout/rails#testing-the-integration)

## Getting up and running

1. Clone this project
1. `cd` into inventory_app
1. run `rake db:migrate`
1. run `rake db:seed`

**Please read the following**
* `rake db:seed` will create 3 accounts
  * 1 Admin level user
    * username: `admin@admin.com` password: `admin@admin.com`
    * This user will be able to do all the things, including mainting Active Storage images tied to products
    * This user landing page is the admin panel
  * 1 Buyer level user
    * username: `buyer@buyer.com` password: `buyer@buyer.com`
    * This user will only be able to see products, checkout and pay
    * This user landing page is the admin panel
  * 1 Seller level user
    * username: `seller@seller.com` password: `seller@seller.com`
    * This user will be able to create products and their inventory as well as buyer actions
    * This user landing page is the root view which displays products

* I implemented the `SELL/BUY Images`
  * I treated `images` as products, so products are being sold
  * I did not added seeds for products because one of the tasks is `ability to manage inventory`
    * To manage inventory login as an admin or seller and add a record to products
    * After you have added a product go the inventory and select the recently added product and set the quantity of the goods you are selling
     * (Protip): Try login as a buyer and try checking out for a product with more quantity than there is inventory :)

Thanks for reading through all of it, I hope you enjoyed the journey. Take care! :)
