# Introduction #

Welcome to the Payhere API! You can use our API to send and receive money, through major mobile money providers, visa and bank transfers

Payhere is fully based on [REST](http://en.wikipedia.org/wiki/Representational_State_Transfer) API  (Application Programming Interfaces). This implies that the API uses standard HTTP verbs which are understood by most HTTP clients. We have language bindings in PHP and JavaScript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

Payhere APIs is a payment platform powerhouse. Behind these APIs is a software layer connecting and optimizing payments services around the world to allow businesses to send and receive money, globally.

## Getting started ##

Go to https://dashboard.payhere.africa/register and create a merchant account. If you have a merchant account already, go to the next step.

Once you sign in, you will generate your API APP-ID. Protect your APP-ID, username and password at all times including but not limited to avoiding saving them to source code repositories.

You can always re-generate the username and password if compromised or need to change it.

In as much as you can test on the sandbox as you wish, once you are ready to go into production contact `legal@payhere.africa` so your account gets approved. Once approved then can start to receive and send payments.

## Request/Response Format ##

The default response format is JSON. Requests with a message-body use plain JSON to set or update resource attributes. Successful requests will return a `200 OK` HTTP status.

Some general information about responses:

* Dates are returned in ISO8601 format: `YYYY-MM-DDTHH:MM:SS`
* Resource IDs are returned as integers.
* Any decimal monetary amount, such as prices or totals, will be returned as strings with two decimal places.
* Other amounts, such as item counts, are returned as integers.
* Blank fields are generally included as `null` or emtpy string instead of being omitted.

## Errors ##

Occasionally you might encounter errors when accessing the REST API. There are four possible types:

| Error Code                  | Error Type                                                  |
|-----------------------------|-------------------------------------------------------------|
| `400 Bad Request`           | Invalid request, e.g. using an unsupported HTTP method      |
| `401 Unauthorized`          | Authentication or permission error, e.g. incorrect API-ID |
| `404 Not Found`             | Requests to resources that don't exist or are missing       |
| `500 Internal Server Error` | Server error                                                |

> Payhere REST API error example:

```json
{
  "code": "payhere_rest_term_invalid",
  "message": "Resource doesn't exist.",
  "data": {
    "status": 404
  }
}
```

Errors return both an appropriate HTTP status code and response object which contains a `code`, `message` and `data` attribute.

## Parameters ##

Almost all endpoints accept optional parameters which can be passed as a HTTP query string parameter, e.g. `GET /inpayments?status=completed`. All parameters are documented along each endpoint.

## Pagination ##

Requests that return multiple items will be paginated to 10 items by default. This default can be changed by the site administrator by changing the `posts_per_page` option. Alternatively the items per page can be specified with the `?per_page` parameter:

`GET /inpayments?per_page=15`

You can specify further pages with the `?page` parameter:

`GET /inpayments?page=2`

You may also specify the offset from the first resource using the `?offset` parameter:

`GET /inpayments?offset=5`

Page number is 1-based and omitting the `?page` parameter will return the first page.

The total number of resources and pages are always included in the `X-PH-Total` and `X-PH-TotalPages` HTTP headers.

### Link Header ###

Pagination info is included in the [Link Header](http://tools.ietf.org/html/rfc5988). It's recommended that you follow these values instead of building your own URLs where possible.

```
Link: <https://www.example.com/wp-json/wc/v3/products?page=2>; rel="next",
<https://www.example.com/wp-json/wc/v3/products?page=3>; rel="last"`
```

The possible `rel` values are:

|  Value  |                       Description                        |
|---------|----------------------------------------------------------|
| `next`  | Shows the URL of the immediate next page of results.     |
| `last`  | Shows the URL of the last page of results.               |
| `first` | Shows the URL of the first page of results.              |
| `prev`  | Shows the URL of the immediate previous page of results. |

## Libraries and Tools ##

### Official libraries ###

- [JavaScript](https://www.npmjs.com/package/@payhere/payhere-rest-api) Library
- [PHP](https://packagist.org/packages/rileydigitalservices/payhere) Library
- [Python](https://pypi.python.org/pypi/payhere) Library
- [Ruby](https://rubygems.org/gems/payhere_api) Library

```javascript
// Install:
// npm install --save @payhere/payhere-rest-api

// Setup:
const payhereRestApi = require("@payhere/payhere-rest-api").default;
// import payhereRestApi from "@payhere/payhere-rest-api"; // Supports ESM

const payhere = new payhereRestApi({
  url: 'https://api.payhere.africa', // Your store URL
  username: 'your_username', // Your consumer key
  password: 'your_password', // Your consumer secret
  version: 'v1' // payhere REST API version
});
```

```php
<?php
// Install:
// composer require rileydigitalservices/payhere

// Setup:
require __DIR__ . '/vendor/autoload.php';

use rileydigitalservices\payhere\Client;

$payhere = new Client(
    'https://api.payhere.africa', // Your store URL
    'your_username', // Your username
    'your_password', // Your password
    [
        'version' => 'v1' // payhere REST API version
    ]
);
?>
```

```python
# Install:
# pip install payhere

# Setup:
from payhere import API

wcapi = API(
    url="https://api.payhere.africa", # Your store URL
    username="your_username", # Your username
    password="consumer_secret", # Your password
    version="v1" # payhere REST API version
)
```

```ruby
# Install:
# gem install payhere_api

# Setup:
require "payhere_api"

payhere = payhere::API.new(
  "https://api.payhere.africa", # Your store URL
  "your_username", # Your username
  "your_password", # Your password
  {
    version: "v1" # payhere REST API version
  }
)
```

<aside class="notice">
	Use the tabs in the top-right corner of this page to see how to install and use each library.
</aside>

### Tools ###

Some useful tools you can use to access the API include:

- [Insomnia](https://insomnia.rest) - Cross-platform GraphQL and REST client, available for Mac, Windows, and Linux.
- [Postman](https://www.getpostman.com/) - Cross-platform REST client, available for Mac, Windows, and Linux.
- [RequestBin](https://requestbin.com) - Allows you test webhooks.
- [Hookbin](https://hookbin.com/) - Another tool to test webhooks.