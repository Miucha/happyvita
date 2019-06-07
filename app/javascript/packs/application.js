import "bootstrap";

import 'select2/dist/css/select2.css';
import '../components/address_modal';

import { initSelect2 } from '../components/myselect2';

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

initSelect2();
