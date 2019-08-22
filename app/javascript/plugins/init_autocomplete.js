import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('query_campsite-address');
  addressInput.addEventListener("blur", () => {
    document.getElementById('algolia-places-listbox-0').style.display = "none";
  })
  if (addressInput) {
    places({ container: addressInput, autocompleteOptions: {autoselect: false} });
  }
};

export { initAutocomplete };
