# Robust Software Systems Final Project
## Spring 2013

By David Harboe (s103432),
Anders Emil Nielsen (s103457),
Joachim Friis (s093256),
Anders Gotfredsen (s103465)

# API Documentation

## Routes

### Public

The following routes are public and therefore accessible by anyone

| Action                   | HTTP method | URL           | Require params  | Optional params |
| -------------------------| ----------- | ------------- | --------------  | --------------- |
| See a list of products   | GET         | /products     |                 |                 |
| See details of a product | GET         | /products/:id |                 |                 |
| Register as customer     | POST        | /customers    | email, password | address, name   |

### Customer authentication

The following route is for authenticating a customer. This action creates a session for the given customer and returns a session key, which should be used for the actions that requires token autorization.

This action requires <a name="basicauth"/>

[basicauth](## Basic Authentication)
The

## Token Authentication
