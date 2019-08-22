import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('query_campsite-address');
  if (addressInput) {
    addressInput.addEventListener("blur", () => {
      document.getElementById('algolia-places-listbox-0').style.display = "none";
    })
    places({ container: addressInput, autocompleteOptions: {autoselect: false} });
  }
}

export { initAutocomplete };
