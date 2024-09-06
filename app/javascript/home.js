document.addEventListener("DOMContentLoaded", function() {
  const buttons = document.querySelectorAll(".filter-button");
  const cards = document.querySelectorAll(".card-container");

  buttons.forEach(button => {
    button.addEventListener("click", function() {
      const selectedCategory = this.getAttribute("data-category");

      cards.forEach(card => {
        const cardCategory = card.getAttribute("data-category");

        if (selectedCategory === cardCategory || selectedCategory === "all") {
          card.style.display = "block";  // Mostrar la tarjeta
        } else {
          card.style.display = "none";   // Ocultar la tarjeta
        }
      });
    });
  });
});
