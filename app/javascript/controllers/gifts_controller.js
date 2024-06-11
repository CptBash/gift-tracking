import { Controller } from "@hotwired/stimulus"

export default class GiftsController extends Controller {

    connect() {
        console.log('Hello, Stimulus!', this.element)
    }

  addGift(event) {
    event.preventDefault();

    let time = new Date().getTime();
    let regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
  }

  removeGift(event) {
    event.preventDefault();

    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
  }
}