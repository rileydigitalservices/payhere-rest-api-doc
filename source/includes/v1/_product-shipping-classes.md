# Product - Shipping Classes #

This section lists all API endpoints that can be used to create, edit or otherwise manipulate product shipping classes.

## Product Shipping Class Properties ##

|   Attribute   |   Type  |                                           Description                                           |
| ------------- | ------- | ----------------------------------------------------------------------------------------------- |
| `id`          | integer | Shipping Class ID (term ID) <i class="label label-info">read-only</i>                           |
| `name`        | string  | Shipping Class name <i class="label label-info">required</i>                                    |
| `slug`        | string  | Shipping Class slug                                                                             |
| `parent`      | integer | Shipping Class parent                                                                           |
| `description` | string  | Shipping Class description                                                                      |
| `count`       | integer | Shows the quantity of products in this shipping class <i class="label label-info">read-only</i> |

## Create a Product Shipping Class ##

This API helps you to create a new product shipping class.

### HTTP Request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-post">POST</i>
		<h6>/wc-api/v1/products/shipping_classes</h6>
	</div>
</div>

> Example of how to create a product shipping class:

```shell
curl -X POST https://example.com/wc-api/v1/products/shipping_classes \
	-u consumer_key:consumer_secret \
	-H "Content-Type: application/json" \
	-d '{
  "product_shipping_class": {
    "name": "Priority"
  }
}'
```

```javascript
var data = {
  product_shipping_class: {
    name: 'Priority'
  }
};

Payhere.post('products/shipping_classes', data, function(err, data, res) {
  console.log(res);
});
```

```php
<?php
$data = [
    'product_shipping_class' => [
        'name' => 'Priority'
    ]
];

print_r($payhere->post('products/shipping_classes', $data));
?>
```

```python
data = {
    "product_shipping_class": {
        "name": "Priority"
    }
}

print(wcapi.post("products/shipping_classes", data).json())
```

```ruby
data = {
  product_shipping_class: {
    name: "Priority"
  }
}

payhere.post("products/shipping_classes", data).parsed_response
```

> JSON response example:

```json
{
  "product_shipping_class": {
    "id": 35,
    "name": "Priority",
    "slug": "priority",
    "parent": 0,
    "description": "",
    "count": 0
  }
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>

## View a Product Shipping Class ##

This API lets you retrieve a product shipping class by ID.

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-get">GET</i>
		<h6>/wc-api/v1/products/shipping_classes/&lt;id&gt;</h6>
	</div>
</div>

```shell
curl https://example.com/wc-api/v1/products/shipping_classes/35 \
	-u consumer_key:consumer_secret
```

```javascript
Payhere.get('products/shipping_classes/35', function(err, data, res) {
  console.log(res);
});
```

```php
<?php print_r($payhere->get('products/shipping_classes/35')); ?>
```

```python
print(wcapi.get("products/shipping_classes/35").json())
```

```ruby
payhere.get("products/shipping_classes/35").parsed_response
```

> JSON response example:

```json
{
  "product_shipping_class": {
    "id": 35,
    "name": "Priority",
    "slug": "priority",
    "parent": 0,
    "description": "",
    "count": 0
  }
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>

## View List of Product Shipping Classes ##

This API lets you retrieve all product shipping classes.

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-get">GET</i>
		<h6>/wc-api/v1/products/shipping_classes</h6>
	</div>
</div>

```shell
curl https://example.com/wc-api/v1/products/shipping_classes \
	-u consumer_key:consumer_secret
```

```javascript
Payhere.get('products/shipping_classes', function(err, data, res) {
  console.log(res);
});
```

```php
<?php print_r($payhere->get('products/shipping_classes')); ?>
```

```python
print(wcapi.get("products/shipping_classes").json())
```

```ruby
payhere.get("products/shipping_classes").parsed_response
```

> JSON response example:

```json
{
  "product_shipping_classes": [
    {
      "id": 30,
      "name": "Express",
      "slug": "express",
      "parent": 0,
      "description": "",
      "count": 1
    },
    {
      "id": 35,
      "name": "Priority",
      "slug": "priority",
      "parent": 0,
      "description": "",
      "count": 0
    }
  ]
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>

## Update a Product Shipping Class ##

This API lets you make changes to a product shipping class.

### HTTP Request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-put">PUT</i>
		<h6>/wc-api/v1/products/shipping_classes/&lt;id&gt;</h6>
	</div>
</div>

```shell
curl -X PUT https://example.com/wc-api/v1/products/shipping_classes/35 \
	-u consumer_key:consumer_secret \
	-H "Content-Type: application/json" \
	-d '{
  "product_shipping_class": {
    "description": "Priority mail."
  }
}'
```

```javascript
var data = {
  product_shipping_class: {
    description: 'Priority mail.'
  }
};

Payhere.put('products/shipping_classes/35', data, function(err, data, res) {
  console.log(res);
});
```

```php
<?php
$data = [
    'product_shipping_class' => [
        'description' => 'Priority mail.'
    ]
];

print_r($payhere->put('products/shipping_classes/35', $data));
?>
```

```python
data = {
    "product_shipping_class": {
        "description": "Priority mail."
    }
}

print(wcapi.put("products/shipping_classes/35", data).json())
```

```ruby
data = {
  product_shipping_class: {
    description: "Priority mail."
  }
}

payhere.put("products/shipping_classes/35", data).parsed_response
```

> JSON response example:

```json
{
  "product_shipping_class": {
    "id": 35,
    "name": "Priority",
    "slug": "priority",
    "parent": 0,
    "description": "Priority mail.",
    "count": 0
  }
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>

## Delete a Product Shipping Class ##

This API helps you delete a product shipping class.

### HTTP Request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-delete">DELETE</i>
		<h6>/wc-api/v1/products/shipping_classes/&lt;id&gt;</h6>
	</div>
</div>

```shell
curl -X DELETE https://example.com/wc-api/v1/products/shipping_classes/35 \
	-u consumer_key:consumer_secret
```

```javascript
Payhere.delete('products/shipping_classes/35', function(err, data, res) {
  console.log(res);
});
```

```php
<?php print_r($payhere->delete('products/shipping_classes/35')); ?>
```

```python
print(wcapi.delete("products/shipping_classes/35").json())
```

```ruby
payhere.delete("products/shipping_classes/35").parsed_response
```

> JSON response example:

```json
{
  "message": "Deleted product_shipping_class"
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>
