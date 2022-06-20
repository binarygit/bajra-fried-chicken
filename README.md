# Bajra Fried Chicken

A simple resturant app made with Rails. Live: https://guarded-stream-15849.herokuapp.com/login

I have already seeded the db with some users and the admin and orders. Feel free to use these to look around or to make your own user. There can be only one admin user.

Credentials:

email: avi@avi.com, password: avi

email: ava@ava.com, password: ava

email: admin@admin.com, password: admin

## Key Implementation Details

_Making an order_

The model relationship that enables making orders is simple:
1. A user has_many :bills
2. A bill has_many :orders
3. An order belongs_to :bill, :food

_Adding food to cart_

Cookies are used to keep track of what food and the quantity the user selects. The *cookie* looks like this: `"orders=[{\"food_id\":36,\"quantity\":1,\"total\":150}]"`. JSON is used to parse and stringify. The *set_cookie* stimulus controller is incharge of handling this.

```js
# app/javascript/set_cookie_controller.js
...
  setCookie() {
    let orders = this.orders
    this.deletePastOrder(orders)
    let order = {}
    order.food_id = this.foodIdValue
    order.quantity = Number(this.quantityTarget.innerText)
    order.total = order.quantity * this.priceValue
    orders.push(order)
    document.cookie = ''
    document.cookie = `orders=${JSON.stringify(orders)}`
  }
```

_Editing, Creating Resources in the same page_

Admins can create a new resource (food, table) in the same page without a page refresh. They can also edit tables and instantly have the resource update without a page refresh. 


## Key Features

1. User can make table reservations.
2. User can view all of their reservations.
3. User can order food.
4. User can view all the orders they have made.
5. Admin user can create and edit tables.
6. Admin user can create and edit foods.
7. Admin user can mark orders as paid.
8. Admin user can view all the orders that have been made.


## Known Bug

1. User can place an order without adding any food to cart.
