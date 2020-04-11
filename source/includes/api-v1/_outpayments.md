# Out Payments #

The outpayments API allows a user to recieve money into their payment account/ mobile money number.

## Outpayment properties ##

| Attribute                     | Type      | Description                                                                                                                          |
| ----------------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `processingNumber`                          | string   | Unique identifier for the payment object. <i class="label label-info">mandatory</i>                                                          |
| `sender`                        | string    | Ther person expecting the payment. <i class="label label-info">mandatory</i>                                                                               |
| `amountcharged`                      | string    | The amount of money to be received. Should always be numeric, even if setting a percentage.                                                      |
| `date_added`                | date-time | The date the money was received, in the site's timezone. <i class="label label-info">read-only</i>                                   |
| `transactionStatus`               | string    | Determines if the payment transaction was successful at the aggregators end <i class="label label-info">read-only</i> 
                                       |
| `narration`                 | string    | Description of why the money is being withdrawn.                                                                                                                  |
| `transactionId`                | integer    | The unique transaction id of the money that has been received <i class="label label-info">read-only</i>                                                                                 |
| `gatewayResponse`            | string    | The response from the aggregator. <i class="label label-info">read-only</i>                                                                                  |
| `gateway`                 | integer   | Aggregator whos is facilitating the money movement. <i class="label label-info">read-only</i>                                          |
| `responseTime`                | date-time | The time it took for the full transaction to be completed. <i class="label label-info">read-only</i>
                                  |                                |

## Create ann outpayment ##

This API helps you to create a new outpayment.

### HTTP request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-post">POST</i>
		<h6>/outpayments</h6>
	</div>
</div>

```shell
curl -X POST https://api.payhere.africa/v1/outpayments \
	-u username:your_username \
  -u password:your_password \
  -H "APP-ID: your_app_id" \
  -H "Content-Type: application/json" \
	-d '{
  "processingNumber": "800-jan-salary",
  "msisdn": 256772123456,
  "amount": 500000,
  "narration": "Junuary salary"
}'
```

```javascript
const data = {
  processingNumber: "800-jan-salary",
  msisdn: 256772123456,
  amount: 500000,
  narration: "Junuary salary"
};

Payhere.post("outpayments", data)
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
    'processingNumber' => '800-jan-salary',
    'msisdn' => 256772123456,
    'amount' => 500000,
    'narration' => 'Junuary salary'
];

print_r($payhere->post('outpayments', $data));
?>
```

```python
data = {
    "processingNumber": "800-jan-salary",
    "msisdn": 256772123456,
    "amount": 500000,
    "narration": "Junuary salary"
}

print(wcapi.post("outpayments", data).json())
```

```ruby
data = {
  processingNumber: "800-jan-salary",
  msisdn: 256772123456,
  amount: 500000,
  narration: "Junuary salary"
}

payhere.post("outpayments", data).parsed_response
```

> JSON response example:

```json
{
  "processingNumber": "800-jan-salary",
  "transactionStatus": "pending",
  "_links": {
    "self": [
      {
        "href": "https://api.payhere.africa/v1/outpayments/800-jan-salary"
      }
    ],
    "collection": [
      {
        "href": "https://api.payhere.africa/v1/outpayments"
      }
    ]
  }
}
```

## Retrieve an outpayment ##

This API lets you retrieve and view a specific outpayment by ID.

### HTTP request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-get">GET</i>
		<h6>/outpayments/&lt;id&gt;</h6>
	</div>
</div>

```shell
curl https://api.payhere.africa/v1/outpayments/800-jan-salary \
	-u username:your_username \
  -u password:your_password \
  -H "APP-ID: your_app_id" \
  -H "Content-Type: application/json"
```

```javascript
Payhere.get("outpayments/800-jan-salary")
  .then((response) => {
    console.log(response.data);
  })
  .catch((error) => {
    console.log(error.response.data);
  });
```

```php
<?php print_r($payhere->get('outpayments/800-jan-salary')); ?>
```

```python
print(wcapi.get("outpayments/719").json())
```

```ruby
payhere.get("outpayments/800-jan-salary").parsed_response
```

> JSON response example:

```json
{
  "processingNumber": "800-jan-salary",
  "sender": "256703123456",
  "principalAmount": "500000",
  "serviceCharge": "0",
  "amountcharged": "500000",
  "narration": "January salaray",
  "date_added": "2020-02-13 16:08:35",
  "transactionStatus": "success",
  "transactionId": "89223596900",
  "gatewayResponse": "{\"TXNSTATUS\":1,\"RESPONSE\":\"Success\",\"MESSAGE\":\"Success\",\"EXTTRID\":\"800-jan-salary\",\"TXNID\":\"89223596900\"}",
  "gateway": "airtelMoneyUg",
  "responseTime": "2020-02-13 16:10:16",
  "_links": {
    "self": [
      {
        "href": "https://api.payhere.africa/v1/outpayments/800-jan-salary"
      }
    ],
    "collection": [
      {
        "href": "https://api.payhere.africa/v1/outpayments"
      }
    ]
  }
}
```

## List all outpayments ##

This API helps you to list all the outpayments that have been created.

### HTTP request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-get">GET</i>
		<h6>/outpayments</h6>
	</div>
</div>

```shell
curl https://api.payhere.africa/v1/outpayments \
	-u username:your_username \
  -u password:your_password \
  -H "APP-ID: your_app_id" \
  -H "Content-Type: application/json"
```

```javascript
Payhere.get("outpayments")
  .then((response) => {
    console.log(response.data);
  })
  .catch((error) => {
    console.log(error.response.data);
  });
```

```php
<?php print_r($payhere->get('outpayments')); ?>
```

```python
print(wcapi.get("outpayments").json())
```

```ruby
payhere.get("outpayments").parsed_response
```

> JSON response example:

```json
[
  {
    "processingNumber": "800-jan-salary",
    "sender": "256703123456",
    "principalAmount": "500000",
    "serviceCharge": "0",
    "amountcharged": "500000",
    "narration": "January salaray",
    "date_added": "2020-02-13 16:08:35",
    "transactionStatus": "success",
    "transactionId": "89223596900",
    "gatewayResponse": "{\"TXNSTATUS\":1,\"RESPONSE\":\"Success\",\"MESSAGE\":\"Success\",\"EXTTRID\":\"800-jan-salary\",\"TXNID\":\"89223596900\"}",
    "gateway": "airtelMoneyUg",
    "responseTime": "2020-02-13 16:10:16",
    "_links": {
      "self": [
        {
          "href": "https://api.payhere.africa/v1/outpayments/800-jan-salary"
        }
      ],
      "collection": [
        {
          "href": "https://api.payhere.africa/v1/outpayments"
        }
      ]
    }
  },
  {
    "processingNumber": "400-invoice-123",
    "sender": "256703123456",
    "principalAmount": "30000",
    "serviceCharge": "0",
    "amountcharged": "30000",
    "narration": "Fuel for overtime",
    "date_added": "2020-02-13 16:08:35",
    "transactionStatus": "success",
    "transactionId": "29988296900",
    "gatewayResponse": "{\"TXNSTATUS\":1,\"RESPONSE\":\"Success\",\"MESSAGE\":\"Success\",\"EXTTRID\":\"400-invoice-123\",\"TXNID\":\"29988296900\"}",
    "gateway": "airtelMoneyUg",
    "responseTime": "2020-02-13 16:10:16",
    "_links": {
      "self": [
        {
          "href": "https://api.payhere.africa/v1/outpayments/400-invoice-123"
        }
      ],
      "collection": [
        {
          "href": "https://api.payhere.africa/v1/outpayments"
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

## Batch outpayments ##

This API helps you to batch create multiple outpayments.

<aside class="notice">
Note: By default it's limited to up to 100 objects to be created. 
</aside>

### HTTP request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-post">POST</i>
		<h6>/outpayments/batch</h6>
	</div>
</div>

```shell
curl -X POST https://api.payhere.africa/v1//outpayments/batch \
	-u username:your_username \
  -u password:your_password \
  -H "APP-ID: your_app_id" \
  -H "Content-Type: application/json"
	-d '{
  "create": [
    {
      "processingNumber": "800-jan-salary",
      "msisdn": 256772123456,
      "amount": 500000,
      "narration": "Junuary salary"
    },
    {
      "processingNumber": "400-invoice-123",
      "msisdn": 256772123456,
      "amount": 30000,
      "narration": "Fuel for overtime"
    }
  ]
}'
```

```javascript
const data = {
  create: [
    {
      processingNumber: "800-jan-salary",
      msisdn: 256772123456,
      amount: 500000,
      narration: "Junuary salary"
    },
    {
      processingNumber: "400-invoice-123",
      msisdn: 256772123456,
      amount: 30000,
      narration: "Fuel for overtime"
    }
  ]
};

Payhere.post("outpayments/batch", data)
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
            'processingNumber' => '800-jan-salary',
            'msisdn' => 256772123456,
            'amount' => 500000,
            'narration' => 'Junuary salary'
        ],
        [
            'processingNumber' => '400-invoice-123',
            'msisdn' => 256772123456,
            'amount' => 30000,
            'narration' => 'Fuel for overtime'
        ]
    ]
];

print_r($payhere->post('outpayments/batch', $data));
?>
```

```python
data = {
    "create": [
        {
            "processingNumber": "800-jan-salary",
            "msisdn": 256772123456,
            "amount": 500000,
            "narration": "Junuary salary"
        },
        {
            "processingNumber": "400-invoice-123",
            "msisdn": 256772123456,
            "amount": 30000,
            "narration": "Fuel for overtime"
        }
    ]
}

print(wcapi.post("outpayments/batch", data).json())
```

```ruby
data = {
  create: [
    {
      processingNumber: "800-jan-salary",
      msisdn: 256772123456,
      amount: 500000,
      narration: "Junuary salary"
    },
    {
      processingNumber: "400-invoice-123",
      msisdn: 256772123456,
      amount: 120,
      narration: "Fuel for overtime"
    }
  ]
}

payhere.post("outpayments/batch", data).parsed_response
```

> JSON response example:

```json
{
  "create": [
    {
      "processingNumber": "800-jan-salary",
      "transactionStatus": "pending",
      "_links": {
        "self": [
          {
            "href": "https://api.payhere.africa/v1/outpayments/800-jan-salary"
          }
        ],
        "collection": [
          {
            "href": "https://api.payhere.africa/v1/outpayments"
          }
        ]
      }
    },
    {
      "processingNumber": "400-invoice-123",
      "transactionStatus": "pending",
      "_links": {
        "self": [
          {
            "href": "https://api.payhere.africa/v1/outpayments/400-invoice-123"
          }
        ],
        "collection": [
          {
            "href": "https://api.payhere.africa/v1/outpayments"
          }
        ]
      }
    }
  ]
}
```
