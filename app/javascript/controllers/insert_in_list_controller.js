import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]

  // connect() {
  //   // console.log(this.element)
  //   // console.log(this.itemsTarget)
  //   // console.log(this.formTarget)
  //   this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  // }

  send(event) {
  event.preventDefault()
  // const url = this.formTarget.action
  // console.log(this.formTarget.action)
    fetch(this.formTarget.action, {
    method: "POST",
    headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
    body: new FormData(this.formTarget)
  })
  // console.log(event)
  .then(response => response.json())
  .then((data) => {
    if (data.inserted_item) {
      this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
    }
    this.formTarget.outerHTML = data.form
    })
  }
}
