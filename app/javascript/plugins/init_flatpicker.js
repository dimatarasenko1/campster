import flatpickr from "flatpickr";
import "flatpickr/dist/themes/dark.css";

const initFlatpickr = () => {
  const input = document.querySelector("#date-field");
  if (input) {
    console.log("hi")
    flatpickr(input, {
    });

  }
}

export { initFlatpickr }
