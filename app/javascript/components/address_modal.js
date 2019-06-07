const closeAddressModal = () => {
  $('#addressModal').modal('hide');
}


const addAddressToSelect2 = (address) => {

  var newOption = new Option(address.text, address.id, false, false);
  $('#user_addresses').append(newOption).trigger('change');
}

window.closeAddressModal = closeAddressModal;
window.addAddressToSelect2 = addAddressToSelect2;
