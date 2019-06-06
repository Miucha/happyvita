import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
     placeholder: 'Selecione um endereço'
  });
};

export { initSelect2 };
