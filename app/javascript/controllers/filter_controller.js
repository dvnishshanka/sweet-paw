import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets =["city", "species","price", "form"]

  connect() {
    console.log("Hello filter")
    console.log("city",this.cityTarget)
    console.log("city",this.priceTarget)
    console.log("city",this.speciesTarget)
    this.filterObject = {city: null, price: 0, species: null}
  }

  handleCity(event){
    console.log(this.cityTarget.value)
    this.filterObject.city = this.cityTarget.value

  }
  handlePrice(event){
    console.log(this.priceTarget.value)
    this.filterObject.price = this.priceTarget.value

  }
  handleSpecies(event){
    console.log(this.speciesTarget.value)
    this.filterObject.species = this.speciesTarget.value

  }


  send(event){
    // event.preventDefault()
let price = this.priceTarget.value
let species = this.speciesTarget.value
let city = this.cityTarget.value
console.log(this.filterObject)
this.formTarget.value = this.filterObject
  }
}
