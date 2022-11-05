import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="filter-pets"
export default class extends Controller {
  static targets = ["button", "allPets", "pet"];

  filter(event) {
    this.buttonTargets.forEach((button) => {
      button.classList.remove("selected");
    });
    this.petTargets.forEach((pet) => {
      pet.classList.remove("hide");
    });
    event.target.classList.add("selected");
    this.allPetsTarget.classList.remove("selected");
    this.petTargets.filter((item) => {
      if (!item.innerHTML.includes(event.target.innerHTML)) {
        item.classList.add("hide");
      }
    });
  }

  clearFilter() {
    this.allPetsTarget.classList.add("selected");
    this.buttonTargets.forEach((button) => {
      button.classList.remove("selected");
    });
    this.petTargets.forEach((pet) => {
      pet.classList.remove("hide");
    });
  }
}
