import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['quantity']
  static values = { quantity: { type: Number, default: 1 } }

  increase() {
    this.quantityValue++
  }

  decrease() {
    if (this.quantityValue != 1) {
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
