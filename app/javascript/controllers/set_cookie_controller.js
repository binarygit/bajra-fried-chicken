import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'quantity' ]
  static values = { foodId: Number }

  connect() {
    let cookie = document.cookie

    if (!cookie) {
      // I don't want to check for a empty cookie condition 
      // in setCookie()
      document.cookie = `orders=${JSON.stringify([])}`
    }
  }

  setCookie() {
    let orders = this.orders
    this.deletePastOrder(orders)
    let order = {}
    order.food_id = this.foodIdValue
    order.quantity = Number(this.quantityTarget.innerText)
    orders.push(order)
    document.cookie = ''
    document.cookie = `orders=${JSON.stringify(orders)}`
  }

  deletePastOrder(orders) {
    let pastOrder = this.findPastOrder(orders)
    if (pastOrder) {
      let pastOrderIdx = orders.indexOf(pastOrder)
      orders.splice(pastOrderIdx, 1)
    }
  }

  findPastOrder(orders) {
    let foodIdValue = this.foodIdValue;
    let pastOrder
    orders.forEach(function (order) {
      for (const key in order) {
        if (key == 'food_id' && order[key] == foodIdValue ) {
          pastOrder = order
        }
      }
    })
    return pastOrder
  }

  get orders() {
    let orders = document.cookie.match(/=([\s\S]*)$/)[1]
    return orders  = JSON.parse(orders)
  }
}

