import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['quantity']
  static values = { quantity: { type: Number, default: 0 } }

  increase() {
    this.quantityValue++
  }

  decrease() {
    if (this.quantityValue != 0) {
      this.quantityValue--
    }
  }

  quantityValueChanged() {
    this.updateQuantityValue()
  }

  updateQuantityValue() {
    this.quantityTarget.innerText = this.quantityValue
  }

}
