# Amazoneo E-Commerce Application
# Overview

Amazoneo is an e-commerce application built for training purposes, following the TOP course: https://www.theodinproject.com/. 
Its an ongoing work that allows me to add features whenever I need to practice Rails a bit. You can register fast enough, there is no confirmation email and if you want you can
delete the account in profile/settings


# Setup & Deployment
The application is currently running on a Linode server: http://139.144.55.89/

# Technologies Used

Ruby on Rails.
SQLite3: (Migration pending!)
Puma: Webserver
Nginx: Configured as Reverse Proxy
Turbo-Rails: I used this on the profile page, it gives some nice SPA functionality by allowing specific sections of a page to be updated without refreshing the entire page.
Bcrypt: For authentication.
The images are being handled by Rails Active Storage


# Features
User Authentication: Users can sign up, log in, and log out. Only the admins can create a new product
Product Management: Admin users can add new products. All users can view product details.
Cart Management: Users can add products to their cart and proceed to checkout.
Review System: Users can leave reviews for products they've purchased.
Category Filtering: Products can be filtered based on their categories.
API Endpoints

The application also provides API endpoints for fetching product daClone the repository.
Install the required gems using bundle install.
Set up the database using rails db:migrate.
Start the server using rails server.ta:

API Endpoints

- `GET /api/v1/products`: Fetches all products.
- `GET /api/v1/products/:id`: Fetches details of a specific product.


