import flatpickr from "flatpickr";
import "flatpickr/dist/themes/dark.css";

const initFlatpickr = () => {
  const input = document.querySelector("#query_date-field");
  if (input) {
    flatpickr(input, {
      mode: "range",
      minDate: "today",
      maxDate: new Date().fp_incr(365)
    });
  }
}

export { initFlatpickr }
