# Tax - Classes #

This section lists all API endpoints that can be used to create, edit or otherwise manipulate tax classes.

## Taxes Properties ##

| Attribute |  Type  |                       Description                        |
| --------- | ------ | -------------------------------------------------------- |
| `slug`    | string | Tax class slug <i class="label label-info">read-only</i> |
| `name`    | string | Tax class name                                           |

## Create a Tax Class ##

This API helps you to create a new tax class.

### HTTP Request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-post">POST</i>
		<h6>/wc-api/v1/taxes/classes</h6>
	</div>
</div>

```shell
curl -X POST https://example.com/wc-api/v1/taxes/classes \
    -u consumer_key:consumer_secret \
    -H "Content-Type: application/json" \
    -d '{
  "tax_class": {
    "name": "Zero Rate"
  }
}'
```

```javascript
var data = {
  tax_class: {
    name: 'Zero Rate'
  }
};

Payhere.post('taxes/classes', data, function(err, data, res) {
  console.log(res);
});
```

```php
<?php
$data = [
    'tax_class' => [
        'name' => 'Zero Rate'
    ]
];

print_r($payhere->post('taxes/classes', $data));
?>
```

```python
data = {
    "tax_class": {
        "name": "Zero Rate"
    }
}

print(wcapi.post("taxes/classes", data).json())
```

```ruby
data = {
  tax_class: {
    name: "Zero Rate"
  }
}

payhere.post("taxes/classes", data).parsed_response
```

> JSON response example:

```json
{
  "tax_class": {
    "slug": "zero-rate",
    "name": "Zero Rate"
  }
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>

## View List of Tax Classes ##

This API helps you to view all the tax classes.

### HTTP Request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-get">GET</i>
		<h6>/wc-api/v1/taxes/classes</h6>
	</div>
</div>

```shell
curl https://example.com/wc-api/v1/taxes/classes \
	-u consumer_key:consumer_secret
```

```javascript
Payhere.get('taxes/classes', function(err, data, res) {
  console.log(res);
});
```

```php
<?php print_r($payhere->get('taxes/classes')); ?>
```

```python
print(wcapi.get("taxes/classes").json())
```

```ruby
payhere.get("taxes/classes").parsed_response
```

> JSON response example:

```json
{
  "tax_classes": [
    {
      "slug": "standard",
      "name": "Standard Rate"
    },
    {
      "slug": "reduced-rate",
      "name": "Reduced Rate"
    },
    {
      "slug": "zero-rate",
      "name": "Zero Rate"
    }
  ]
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>

## Delete a Tax Class ##

This API helps you delete a tax class.

<aside class="warning">
	This also will delete all tax rates from the selected class.
</aside>

### HTTP Request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-delete">DELETE</i>
		<h6>/wc-api/v1/taxes/classes/&lt;slug&gt;</h6>
	</div>
</div>

```shell
curl -X DELETE https://example.com/wc-api/v1/taxes/classes/zero-rate \
	-u consumer_key:consumer_secret
```

```javascript
Payhere.delete('taxes/classes/zero-rate', function(err, data, res) {
  console.log(res);
});
```

```php
<?php print_r($payhere->delete('taxes/classes/zero-rate')); ?>
```

```python
print(wcapi.delete("taxes/classes/zero-rate").json())
```

```ruby
payhere.delete("taxes/classes/zero-rate").parsed_response
```

> JSON response example:

```json
{
  "message": "Deleted tax_class"
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>

## View Tax Rate Count ##

This API lets you retrieve a count of all tax rates.

### HTTP Request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-get">GET</i>
		<h6>/wc-api/v1/taxes/classes/count</h6>
	</div>
</div>

```shell
curl https://example.com/wc-api/v1/taxes/classes/count \
	-u consumer_key:consumer_secret
```

```javascript
Payhere.get('taxes/classes/count', function(err, data, res) {
  console.log(res);
});
```

```php
<?php print_r($payhere->get('taxes/classes/count')); ?>
```

```python
print(wcapi.get("taxes/classes/count").json())
```

```ruby
payhere.get("taxes/classes/count").parsed_response
```

> JSON response example:

```json
{
  "count": 3
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>
