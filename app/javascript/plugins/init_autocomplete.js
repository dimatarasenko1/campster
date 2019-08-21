import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('campsite-address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
