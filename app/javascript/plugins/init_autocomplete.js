import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('query_campsite-address');
  if (addressInput) {
    addressInput.addEventListener("blur", () => {
      document.getElementById('algolia-places-listbox-0').style.display = "none";
    })
    places({ container: addressInput, autocompleteOptions: {autoselect: false} });
  }
  const secondAddressInput = document.getElementById('campsite-address');
  if (secondAddressInput) {
    secondAddressInput.addEventListener("blur", () => {
      document.getElementById('algolia-places-listbox-0').style.display = "none";
    })
    places({ container: secondAddressInput, autocompleteOptions: {autoselect: false} });
  }
}

export { initAutocomplete };
