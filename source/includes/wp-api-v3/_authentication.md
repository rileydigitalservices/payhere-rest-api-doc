# Authentication #

Payhere users an API-ID and basic auth to authenticate payments over the REST API requests. 

## REST API keys ##

Pre-generated API-ID is used to authenticate use of the REST API endpoints. New keys can be auto-generated through an endpoint.

## Authentication over HTTPS ##

Payhere uses [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication) by providing the REST API with username and password.

> HTTP Basic Auth example

```shell
curl https://api.payhere.africa/v1/inpayments \
    -u username:username
    -u password:password
```

```javascript
const PayhereRestApi = require("@payhere/payhere-rest-api").default;
// import PayhereRestApi from "@payhere/payhere-rest-api"; // Supports ESM

const payhere = new PayhereRestApi({
  url: 'https://api.payhere.africa',
  username: 'your_username',
  password: 'your_password',
  version: 'v1'
});
```

```php
<?php
require __DIR__ . '/vendor/autoload.php';

use RileyDigitalServices\payhere\Client;

$payhere = new Client(
    'https://api.payhere.africa',
    'your_username',
    'your_password',
    [
        'version' => 'v1'
    ]
);
?>
```

```python
from payhere import API

wcapi = API(
    url="https://api.payhere.africa",
    username="your_username",
    password="your_password",
    version="v1"
)
```

```ruby
require "payhere_api"

payhere = payhere::API.new(
  "https://api.payhere.africa",
  "username",
  "password",
  {
    version: "v1"
  }
)
```

> Make sure to replace `your_app_id` with your APP ID, `your_username ` with your *username*, `your_password` with *passwrod*

Payhere uses APP ID, username and passwrod to allow access to the API. You can register a new Payhere APP ID at our [merchant portal](https://dashboard.payhere.africa).

Payhere expects the APP ID, username and password to be included in all API requests to the server in a header that looks like the following:

`APP-ID: your_app_id`
`username: your_username`
`password: your_password`

<aside class="notice">
You must replace <code>your_app_id</code> with your personal APP ID, <code>your_username</code> with your personal username and <code>your_password</code> with your personal password.
</aside>

Occasionally some servers may not parse the Authorization header correctly (if you see a "Username is missing" error when authenticating over SSL, you have a server issue). In this case, you may provide the username/password as query string parameters instead.

> Example for servers that not properly parse the Authorization header:

```shell
curl https://api.payhere.africa/v1/inpayments?username=123&password=abc
```

```javascript
const PayhereRestApi = require("@payhere/payhere-rest-api").default;
// import PayhereRestApi from "@payhere/payhere-rest-api"; // Supports ESM

const payhere = new PayhereRestApi({
  url: 'https://api.payhere.africa',
  username: 'your_username',
  password: 'your_password',
  version: 'v1',
  queryStringAuth: true // Force Basic Authentication as query string true and using under HTTPS
});
```

```php
<?php
require __DIR__ . '/vendor/autoload.php';

use RileyDigitalServices\payhere\Client;

$payhere = new Client(
    'https://api.payhere.africa',
    'your_username',
    'your_password',
    [
        'version' => 'v1',
        'query_string_auth' => true // Force Basic Authentication as query string true and using under HTTPS
    ]
);
?>
```

```python
from payhere import API

wcapi = API(
    url="https://api.payhere.africa",
    username="your_username",
    password="your_password",
    version="v1",
    query_string_auth=True // Force Basic Authentication as query string true and using under HTTPS
)
```

```ruby
require "payhere_api"

payhere = payhere::API.new(
  "https://api.payhere.africa",
  "your_username",
  "your_password",
  {
    version: "v1",
    query_string_auth: true // Force Basic Authentication as query string true and using under HTTPS
  }
)
```
