// JS Import
import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initModal } from '../plugins/init_modal';
import { initFlatpickr } from '../plugins/init_flatpicker';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

// Call JS functions
initMapbox();
initAutocomplete();
initModal();
initFlatpickr();
