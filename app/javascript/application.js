// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"]

  filter(event) {
    const selectedCategory = event.currentTarget.dataset.category;

    this.cardTargets.forEach(card => {
      const cardCategory = card.dataset.category;

      if (selectedCategory === cardCategory || selectedCategory === "all") {
        card.style.display = "block";  // Mostrar la tarjeta
      } else {
        card.style.display = "none";   // Ocultar la tarjeta
      }
    });
  }
}
