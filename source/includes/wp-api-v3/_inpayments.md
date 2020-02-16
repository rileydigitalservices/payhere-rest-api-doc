# In Payments #

The inpayments API allows you to create, and view money that is being sent.

## Inpayment properties ##

| Attribute                     | Type      | Description                                                                                                                          |
| ----------------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `processingNumber`                          | string   | Unique identifier for the payment object. <i class="label label-info">mandatory</i>                                                          |
| `sender`                        | string    | Ther person making the payment. <i class="label label-info">mandatory</i>                                                                               |
| `amountcharged`                      | string    | The amount of money sent. Should always be numeric, even if setting a percentage.                                                      |
| `date_added`                | date-time | The date the money was sent, in the site's timezone. <i class="label label-info">read-only</i>                                   |
| `transactionStatus`               | string    | Determines if the payment was successful at the aggregators end <i class="label label-info">read-only</i> 
                                       |
| `narration`                 | string    | Description of what is being paid for.                                                                                                                  |
| `transactionId`                | integer    | The unique transaction id of the money that has been sent <i class="label label-info">read-only</i>                                                                                 |
| `gatewayResponse`            | string    | The response from the aggregator. <i class="label label-info">read-only</i>                                                                                  |
| `gateway`                 | integer   | Aggregator whos is facilitating the money movement. <i class="label label-info">read-only</i>                                          |
| `responseTime`                | date-time | The time it took for the full transaction to be completed. <i class="label label-info">read-only</i>
                                  |                                |

## Create ann inpayment ##

This API helps you to create a new inpayment.

### HTTP request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-post">POST</i>
		<h6>/inpayments</h6>
	</div>
</div>

```shell
curl -X POST https://api.payhere.africa/v1/inpayments \
	-u username:your_username \
  -u password:your_password \
  -H "APP-ID: your_app_id" \
  -H "Content-Type: application/json" \
	-d '{
  "processingNumber": "12ahhdashh223h2882",
  "msisdn": 256772123456,
  "amount": 500000,
  "narration": "Paying for 4 nights in riley hotel"
}'
```

```javascript
const data = {
  processingNumber: "12ahhdashh223h2882",
  msisdn: 256772123456,
  amount: 500000,
  narration: "Paying for 4 nights in riley hotel"
};

Payhere.post("inpayments", data)
  .then((response) => {
    console.log(response.data);
  })
  .catch((error) => {
    console.log(error.response.data);
  });
```

```php
<?php
$data = [
    'processingNumber' => '12ahhdashh223h2882',
    'msisdn' => 256772123456,
    'amount' => 500000,
    'narration' => 'Paying for 4 nights in riley hotel'
];

print_r($payhere->post('inpayments', $data));
?>
```

```python
data = {
    "processingNumber": "12ahhdashh223h2882",
    "msisdn": 256772123456,
    "amount": 500000,
    "narration": "Paying for 4 nights in riley hotel"
}

print(wcapi.post("inpayments", data).json())
```

```ruby
data = {
  processingNumber: "12ahhdashh223h2882",
  msisdn: 256772123456,
  amount: 500000,
  narration: "Paying for 4 nights in riley hotel"
}

payhere.post("inpayments", data).parsed_response
```

> JSON response example:

```json
{
  "processingNumber": "12ahhdashh223h2882",
  "transactionStatus": "pending",
  "_links": {
    "self": [
      {
        "href": "https://api.payhere.africa/v1/inpayments/12ahhdashh223h2882"
      }
    ],
    "collection": [
      {
        "href": "https://api.payhere.africa/v1/inpayments"
      }
    ]
  }
}
```

## Retrieve an inpayment ##

This API lets you retrieve and view a specific inpayment by ID.

### HTTP request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-get">GET</i>
		<h6>/inpayments/&lt;id&gt;</h6>
	</div>
</div>

```shell
curl https://api.payhere.africa/v1/inpayments/12ahhdashh223h2882 \
	-u username:your_username \
  -u password:your_password \
  -H "APP-ID: your_app_id" \
  -H "Content-Type: application/json"
```

```javascript
Payhere.get("inpayments/12ahhdashh223h2882")
  .then((response) => {
    console.log(response.data);
  })
  .catch((error) => {
    console.log(error.response.data);
  });
```

```php
<?php print_r($payhere->get('inpayments/12ahhdashh223h2882')); ?>
```

```python
print(wcapi.get("inpayments/719").json())
```

```ruby
payhere.get("inpayments/12ahhdashh223h2882").parsed_response
```

> JSON response example:

```json
{
  "processingNumber": "10househelp1001",
  "sender": "256703123456",
  "principalAmount": "500",
  "serviceCharge": "0",
  "amountcharged": "500",
  "narration": "Maid service",
  "date_added": "2020-02-13 16:08:35",
  "transactionStatus": "success",
  "transactionId": "35923596955",
  "gatewayResponse": "{\"TXNSTATUS\":1,\"RESPONSE\":\"Success\",\"MESSAGE\":\"Success\",\"EXTTRID\":\"10househelp1001\",\"TXNID\":\"35923596955\"}",
  "gateway": "airtelMoneyUg",
  "responseTime": "2020-02-13 16:10:16",
  "_links": {
    "self": [
      {
        "href": "https://api.payhere.africa/v1/inpayments/12ahhdashh223h2882"
      }
    ],
    "collection": [
      {
        "href": "https://api.payhere.africa/v1/inpayments"
      }
    ]
  }
}
```

## List all inpayments ##

This API helps you to list all the inpayments that have been created.

### HTTP request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-get">GET</i>
		<h6>/inpayments</h6>
	</div>
</div>

```shell
curl https://api.payhere.africa/v1/inpayments \
	-u username:your_username \
  -u password:your_password \
  -H "APP-ID: your_app_id" \
  -H "Content-Type: application/json"
```

```javascript
Payhere.get("inpayments")
  .then((response) => {
    console.log(response.data);
  })
  .catch((error) => {
    console.log(error.response.data);
  });
```

```php
<?php print_r($payhere->get('inpayments')); ?>
```

```python
print(wcapi.get("inpayments").json())
```

```ruby
payhere.get("inpayments").parsed_response
```

> JSON response example:

```json
[
  {
    "processingNumber": "househelp1001",
    "sender": "256703123456",
    "principalAmount": "500",
    "serviceCharge": "0",
    "amountCharged": "500",
    "narration": "Maid service",
    "date_added": "2020-02-13 15:40:24",
    "transactionStatus": "success",
    "transactionId": "35923596955",
    "gatewayResponse": "{\"TXNSTATUS\":1,\"RESPONSE\":\"Success\",\"MESSAGE\":\"Success\",\"EXTTRID\":\"househelp1001\",\"TXNID\":\"35923596955\"}",
    "gateway": "airtelMoneyUg",
    "responseTime": "2020-02-13 15:51:02",
    "_links": {
      "self": [
        {
          "href": "https://api.payhere.africa/v1/inpayments/12ahhdashh223h2882"
        }
      ],
      "collection": [
        {
          "href": "https://api.payhere.africa/v1/inpayments"
        }
      ]
    }
  },
  {
    "processingNumber": "676test",
    "sender": "256757123456",
    "principalAmount": "10000",
    "serviceCharge": "0",
    "amountCharged": "10000",
    "narration": "test payment",
    "date_added": "2020-02-13 16:55:47",
    "transactionStatus": "success",
    "transactionId": "35923596955",
    "gatewayResponse": "{\"TXNSTATUS\":1,\"RESPONSE\":\"Success\",\"MESSAGE\":\"Success\",\"EXTTRID\":\"676test\",\"TXNID\":\"35923596955\"}",
    "gateway": "airtelMoneyUg",
    "responseTime": "2020-02-13 16:57:16",
    "_links": {
      "self": [
        {
          "href": "https://api.payhere.africa/v1/inpayments/12ahhdashh223h2882"
        }
      ],
      "collection": [
        {
          "href": "https://api.payhere.africa/v1/inpayments"
        }
      ]
    }
  }
]
```

#### Available parameters ####

| Parameter  | Type    | Description                                                                                                                  |
| ---------- | ------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `page`     | integer | Current page of the collection. Default is `1`.                                                                              |
| `per_page` | integer | Maximum number of items to be returned in result set. Default is `10`.                                                       |
| `search`   | string  | Limit results to those matching a string.                                                                                    |
| `after`    | string  | Limit response to resources published after a given ISO8601 compliant date.                                                  |
| `before`   | string  | Limit response to resources published before a given ISO8601 compliant date.                                                 |
| `exclude`  | array   | Ensure result set excludes specific IDs.                                                                                     |
| `include`  | array   | Limit result set to specific ids.                                                                                            |
| `offset`   | integer | Offset the result set by a specific number of items.                                                                         |
| `order`    | string  | Order sort attribute ascending or descending. Options: `asc` and `desc`. Default is `desc`.                                  |
| `orderby`  | string  | Sort collection by object attribute. Options: `date`, `id`, `include`, `title` and `slug`. Default is `date`.                |
| `code`     | string  | Limit result set to resources with a specific code.                                                                          |

## Batch inpayments ##

This API helps you to batch create multiple inpayments.

<aside class="notice">
Note: By default it's limited to up to 100 objects to be created. 
</aside>

### HTTP request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-post">POST</i>
		<h6>/inpayments/batch</h6>
	</div>
</div>

```shell
curl -X POST https://api.payhere.africa/v1//inpayments/batch \
	-u username:your_username \
  -u password:your_password \
  -H "APP-ID: your_app_id" \
  -H "Content-Type: application/json"
	-d '{
  "create": [
    {
      "processingNumber": "12ahhdashh223h2882",
      "msisdn": 256772123456,
      "amount": 500000,
      "narration": "Paying for 4 nights in riley hotel"
    },
    {
      "processingNumber": "123-umeme-2882",
      "msisdn": 256772123456,
      "amount": 120000,
      "narration": "Paying for yaka"
    }
  ]
}'
```

```javascript
const data = {
  create: [
    {
      processingNumber: "12ahhdashh223h2882",
      msisdn: 256772123456,
      amount: 500000,
      narration: "Paying for 4 nights in riley hotel"
    },
    {
      processingNumber: "123-umeme-2882",
      msisdn: 256772123456,
      amount: 120000,
      narration: "Paying for yaka"
    }
  ]
};

Payhere.post("inpayments/batch", data)
  .then((response) => {
    console.log(response.data);
  })
  .catch((error) => {
    console.log(error.response.data);
  });
```

```php
<?php
$data = [
    'create' => [
        [
            'processingNumber' => '12ahhdashh223h2882',
            'msisdn' => 256772123456,
            'amount' => 500000,
            'narration' => 'Paying for 4 nights in riley hotel'
        ],
        [
            'processingNumber' => '123-umeme-2882',
            'msisdn' => 256772123456,
            'amount' => 120000,
            'narration' => 'Paying for yaka'
        ]
    ]
];

print_r($payhere->post('inpayments/batch', $data));
?>
```

```python
data = {
    "create": [
        {
            "processingNumber": "12ahhdashh223h2882",
            "msisdn": 256772123456,
            "amount": 500000,
            "narration": "Paying for 4 nights in riley hotel"
        },
        {
            "processingNumber": "123-umeme-2882",
            "msisdn": 256772123456,
            "amount": 120000,
            "narration": "Paying for yaka"
        }
    ]
}

print(wcapi.post("inpayments/batch", data).json())
```

```ruby
data = {
  create: [
    {
      processingNumber: "12ahhdashh223h2882",
      msisdn: 256772123456,
      amount: 500000,
      narration: "Paying for 4 nights in riley hotel"
    },
    {
      processingNumber: "123-umeme-2882",
      msisdn: 256772123456,
      amount: 120,
      narration: "Paying for yaka"
    }
  ]
}

payhere.post("inpayments/batch", data).parsed_response
```

> JSON response example:

```json
{
  "create": [
    {
      "processingNumber": "12ahhdashh223h2882",
      "transactionStatus": "pending",
      "_links": {
        "self": [
          {
            "href": "https://api.payhere.africa/v1/inpayments/12ahhdashh223h2882"
          }
        ],
        "collection": [
          {
            "href": "https://api.payhere.africa/v1/inpayments"
          }
        ]
      }
    },
    {
      "processingNumber": "123-umeme-2882",
      "transactionStatus": "pending",
      "_links": {
        "self": [
          {
            "href": "https://api.payhere.africa/v1/inpayments/123-umeme-2882"
          }
        ],
        "collection": [
          {
            "href": "https://api.payhere.africa/v1/inpayments"
          }
        ]
      }
    }
  ]
}
```
