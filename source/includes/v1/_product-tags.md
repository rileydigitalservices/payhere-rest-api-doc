# Product - Tags #

This section lists all API endpoints that can be used to create, edit or otherwise manipulate product tags.

## Product Tag Properties ##

|   Attribute   |   Type  |                                     Description                                      |
| ------------- | ------- | ------------------------------------------------------------------------------------ |
| `id`          | integer | Tag ID (term ID) <i class="label label-info">read-only</i>                           |
| `name`        | string  | Tag name <i class="label label-info">required</i>                                    |
| `slug`        | string  | Tag slug                                                                             |
| `description` | string  | Tag description                                                                      |
| `count`       | integer | Shows the quantity of products in this tag <i class="label label-info">read-only</i> |

## Create a Product Tag ##

This API helps you to create a new product tag.

### HTTP Request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-post">POST</i>
		<h6>/wc-api/v1/products/tags</h6>
	</div>
</div>

> Example of how to create a product tag:

```shell
curl -X POST https://example.com/wc-api/v1/products/tags \
	-u consumer_key:consumer_secret \
	-H "Content-Type: application/json" \
	-d '{
  "product_tag": {
    "name": "Leather Shoes"
  }
}'
```

```javascript
var data = {
  product_tag: {
    name: 'Leather Shoes'
  }
};

Payhere.post('products/tags', data, function(err, data, res) {
  console.log(res);
});
```

```php
<?php
$data = [
    'product_tag': [
        'name' => 'Leather Shoes'
    ]
];

print_r($payhere->post('products/tags', $data));
?>
```

```python
data = {
    "product_tag": {
        "name": "Leather Shoes"
    }
}

print(wcapi.post("products/tags", data).json())
```

```ruby
data = {
  product_tag: {
    name: "Leather Shoes"
  }
}

payhere.post("products/tags", data).parsed_response
```

> JSON response example:

```json
{
  "product_tag": {
    "id": 37,
    "name": "Leather Shoes",
    "slug": "leather-shoes",
    "description": "",
    "count": 0
  }
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>

## View a Product Tag ##

This API lets you retrieve a product tag by ID.

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-get">GET</i>
		<h6>/wc-api/v1/products/tags/&lt;id&gt;</h6>
	</div>
</div>

```shell
curl https://example.com/wc-api/v1/products/tags/37 \
	-u consumer_key:consumer_secret
```

```javascript
Payhere.get('products/tags/37', function(err, data, res) {
  console.log(res);
});
```

```php
<?php print_r($payhere->get('products/tags/37')); ?>
```

```python
print(wcapi.get("products/tags/37").json())
```

```ruby
payhere.get("products/tags/37").parsed_response
```

> JSON response example:

```json
{
  "product_tag": {
    "id": 37,
    "name": "Leather Shoes",
    "slug": "leather-shoes",
    "description": "",
    "count": 0
  }
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>

## View List of Product Tags ##

This API lets you retrieve all product tag.

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-get">GET</i>
		<h6>/wc-api/v1/products/tags</h6>
	</div>
</div>

```shell
curl https://example.com/wc-api/v1/products/tags \
	-u consumer_key:consumer_secret
```

```javascript
Payhere.get('products/tags', function(err, data, res) {
  console.log(res);
});
```

```php
<?php print_r($payhere->get('products/tags')); ?>
```

```python
print(wcapi.get("products/tags").json())
```

```ruby
payhere.get("products/tags").parsed_response
```

> JSON response example:

```json
{
  "product_tags": [
    {
      "id": 37,
      "name": "Leather Shoes",
      "slug": "leather-shoes",
      "description": "",
      "count": 0
    },
    {
      "id": 38,
      "name": "Oxford Shoes",
      "slug": "oxford-shoes",
      "description": "",
      "count": 0
    }
  ]
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>

## Update a Product Tag ##

This API lets you make changes to a product tag.

### HTTP Request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-put">PUT</i>
		<h6>/wc-api/v1/products/tags/&lt;id&gt;</h6>
	</div>
</div>

```shell
curl -X PUT https://example.com/wc-api/v1/products/tags/37 \
	-u consumer_key:consumer_secret \
	-H "Content-Type: application/json" \
	-d '{
  "product_tag": {
    "description": "Genuine leather."
  }
}'
```

```javascript
var data = {
  product_tag: {
    description: 'Genuine leather.'
  }
};

Payhere.put('products/tags/37', data, function(err, data, res) {
  console.log(res);
});
```

```php
<?php
$data = [
    'product_tag': [
        'description': 'Genuine leather.'
    ]
];

print_r($payhere->put('products/tags/37', $data));
?>
```

```python
data = {
    "product_tag": {
        "description": "Genuine leather."
    }
}

print(wcapi.put("products/tags/37", data).json())
```

```ruby
data = {
  product_tag: {
    description: "Genuine leather."
  }
}

payhere.put("products/tags/37", data).parsed_response
```

> JSON response example:

```json
{
  "product_tag": {
    "id": 37,
    "name": "Leather Shoes",
    "slug": "leather-shoes",
    "description": "Genuine leather.",
    "count": 0
  }
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>

## Delete a Product Tag ##

This API helps you delete a product tag.

### HTTP Request ###

<div class="api-endpoint">
	<div class="endpoint-data">
		<i class="label label-delete">DELETE</i>
		<h6>/wc-api/v1/products/tags/&lt;id&gt;</h6>
	</div>
</div>

```shell
curl -X DELETE https://example.com/wc-api/v1/products/tags/37 \
	-u consumer_key:consumer_secret
```

```javascript
Payhere.delete('products/tags/37', function(err, data, res) {
  console.log(res);
});
```

```php
<?php print_r($payhere->delete('products/tags/37')); ?>
```

```python
print(wcapi.delete("products/tags/37").json())
```

```ruby
payhere.delete("products/tags/37").parsed_response
```

> JSON response example:

```json
{
  "message": "Deleted product_tag"
}
```

<aside class="notice">
	Endpoint introduced since Payhere 2.5.
</aside>
