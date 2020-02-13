---
title: Payhere API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - php
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Payhere API! You can use our API to send and receive money, through major mobile money providers, visa and bank transfers

We have language bindings in PHP and JavaScript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

Payhere APIs (Application Programming Interfaces) is payment platform powerhouse. Behind these APIs is a software layer connecting and optimizing payments services around the world to allow businesses to send and receive money, globally.

# Getting started

Go to https://dashboard.payhere.africa/register and create a merchant account. If you have a merchant account already, go to the next step.

Once you sign in, you will generate API keys (sid and token). Protect these credentials at all times including but not limited to avoiding saving them to source code repositories.

You can always re-generate the sid and token if compromised or need to change it.

In as much as you can test on the sandbox as you wish, once you are ready to go into production contact `legal@payhere.africa` so your account gets approved. Once approved then can start to receive and send payments.

# Authentication

> To authorize, use this code:

```php
// Update the path below to your autoload.php,
// see https://getcomposer.org/doc/01-basic-usage.md
require_once '/path/to/vendor/autoload.php';

use Payhere\Rest\Client;

// Find your App id and Auth Token at https://dashboard.payhere.africa

$appId    = "your_app_id";
$token  = "your_auth_token";
$payhere = new Client($appId, $token);

```

```javascript
// Download the helper library from https://www.twilio.com/docs/node/install
// Your APP ID and Auth Token from https://dashboard.payhere.africa
const appId = 'your_app_id';
const authToken = 'your_auth_token';
const client = require('payhere')(appId, authToken);

```

> Make sure to replace `your_app_id` with your APP ID

Payhere uses APP ID to allow access to the API. You can register a new Payhere APP ID at our [merchant portal](https://dashboard.payhere.africa).

Payhere expects for the APP ID to be included in all API requests to the server in a header that looks like the following:

`APP-ID: your_app_id`

<aside class="notice">
You must replace <code>your_app_id</code> with your personal APP ID.
</aside>

# Data Exchange Formats
Request
The api requires request data as json string data.
Base Url
https://api.dusupay.com

All production api endpoints have the above base url
All Requests
Require http header => Content-Type: application/json
Whenever you are POSTING data to the api, make sure you are posting a json string to the endpoint.

Response
The api only responds with json string data.
General Response format

Response codes

includes/_errors.md


# In Payments

## Get All In Payments

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all inpayments.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific In Payment

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

