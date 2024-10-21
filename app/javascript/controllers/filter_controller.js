import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["service"]

  filter(event) {
    const categoryId = event.currentTarget.dataset.category;

    // Mostrar todos los servicios si el botón "Todos" está activado
    if (categoryId === "all") {
      this.serviceTargets.forEach(service => {
        service.classList.remove("d-none"); // Mostrar todos
      });
    } else {
      // Aplicar filtro basado en la categoría seleccionada
      this.serviceTargets.forEach(service => {
        if (service.dataset.category === categoryId) {
          service.classList.remove("d-none"); // Mostrar los que coinciden
        } else {
          service.classList.add("d-none"); // Ocultar los que no coinciden
        }
      });
    }
  }
}
