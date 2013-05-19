# Robust Software Systems Final Project Spring 2013

By David Harboe (s103432),
Anders Emil Nielsen (s103457),
Joachim Friis (s093256),
Anders Gotfredsen (s103465)

# API Documentation

This API is a JSON api accepts therefore only JSON request. A JSON request is executed by adding ```application/json``` to the header ```Content-Type```.

The host of this API is [https://robust02241.herokuapp.com](https://robust02241.herokuapp.com)

## Routes

### Public

The following routes are public and therefore accessible by anyone

| Action                   | HTTP method | URL           | Require params  | Optional params |
| -------------------------| ----------- | ------------- | --------------  | --------------- |
| See a list of products   | GET         | /products     |                 |                 |
| See details of a product | GET         | /products/:id |                 |                 |
| Register as customer     | POST        | /customers    | email, password | address, name   |

### <a name="customer_auth">Customer authentication</a>

The following route is for authenticating a customer. This action creates a session for the given customer and returns a session key, which should be used for the actions that requires token autorization.

This action requires [Basic authentication](#basicauth)

| Action                    | HTTP method | URL                       | Require params  | Optional params |
| ------------------------- | ----------- | ------------------------- | --------------  | --------------- |
| Create a customer session | POST        | /customer/authentications |                 |                 |

### Customer specific actions

These actions are specific for a given customer and can only be executed by the authorized customer.

This action requires [Token authentication](#tokenauth). The token is the access token from [authentication](#customer_auth).

| Action                   | HTTP method | URL           | Required params          | Optional params |
| -------------------------| ----------- | ------------- | ------------------------ | --------------- |
| See a list of orders     | GET         | /orders       |                          |                 |
| Create an order          | POST        | /orders/:id   | product_ids, paymentinfo | date            |
| Get details of an order  | GET         | /orders/:id   |                          |                 |
| Delete an order          | DELETE      | /orders/:id   |                          |                 |

### <a name="admin_auth">Administrator authentication</a>

The following route is for authenticating a administrator. This action creates a session for the given administrator and returns a session key, which should be used for the actions that requires token autorization.

This action requires [Basic authentication](#basicauth)

| Action                   | HTTP method | URL                       | Require params  | Optional params |
| -------------------------| ----------- | ------------------------- | --------------  | --------------- |
| Create a admin session   | POST        | /admin/authentications    |                 |                 |

### Administrator specific actions

These actions are specific for a given administrator and can only be executed by the authorized administrator.

This action requires [Token authentication](#tokenauth). The token is the access token from [authentication](#admin_auth).

| Action                          | HTTP method | URL                         | Required params          | Optional params |
| ------------------------------- | ----------- | --------------------------- | ------------------------ | --------------- |
| See a list of customers         | GET         | /admin/customers            |                          |                 |
| Create a customer               | POST        | /admin/customers/:id        | email, password          | address, name   |
| Edit a customer                 | POST        | /admin/customers/:id        | email, password          | address, name   |
| Get details of a customer       | GET         | /admin/customers/:id        |                          |                 |
| Delete a customer               | DELETE      | /admin/customers/:id        |                          |                 |
| See a list of products          | GET         | /admin/products             |                          |                 |
| Create a product                | POST        | /admin/products/:id         | name, price              | name, price     |
| Edit a product                  | POST        | /admin/products/:id         | name, price              | name, price     |
| Get details of a product        | GET         | /admin/products/:id         |                          |                 |
| Delete a product                | DELETE      | /admin/products/:id         |                          |                 |
| See a list of administrators    | GET         | /admin/administrators       |                          |                 |
| Create a administrator          | POST        | /admin/administrators/:id   | email, password          | address, name   |
| Edit a administrator            | POST        | /admin/administrators/:id   | email, password          | address, name   |
| Get details of a administrator  | GET         | /admin/administrators/:id   |                          |                 |
| Delete a administrator          | DELETE      | /admin/administrators/:id   |                          |                 |

## <a name="basicauth">Basic Authentication</a>
Basic authentication is used by encoding the string ```email:password``` (where email is your email and password is your password) with **Base64**. This value is the inserted in the header ```Authorization``` as follows:

```Authorization: Basic encodedvalue```

## <a name="tokenauth">Token Authentication</a>
Token authentication is used by inserting the token in the ```Authorization``` header as follows:

```Authorization: Token token="myaccesstoken"```


