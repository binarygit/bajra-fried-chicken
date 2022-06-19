import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  createToast() {
    let toast = document.createElement('p')
    let toasterContainer = document.querySelector('.toast-container')
    toast.textContent = 'Item successfully added to cart!'
    toasterContainer.appendChild(toast)
  }

  async deleteToast() {
    await this.sleep(2000)
    let toasterContainer = document.querySelector('.toast-container')
    toasterContainer.removeChild(toasterContainer.firstChild)
  }

  sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
}
