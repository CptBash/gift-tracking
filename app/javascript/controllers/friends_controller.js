import { Controller } from "@hotwired/stimulus"

export default class FriendsController extends Controller {
  static targets = ["gifts", "addGift"];

  connect() {
    this.giftCounter = this.giftsTarget.querySelectorAll('.gift-fields').length;
    this.userId = this.data.get("userId")
  }

  addGift(event) {
    event.preventDefault();

    // Get the current user id
    const current_user_id = this.userId;
    const giftFields = document.createElement("div");
    giftFields.classList.add("gift-fields");

    giftFields.innerHTML = `
      <div class="form-group d-inline-block col-3">
        <label for="friend_gifts_attributes_${this.giftCounter}_name">Description<span style="color: red">*</span></label>
        <input type="text" name="friend[gifts_attributes][${this.giftCounter}][name]" class="form-control">
      </div>

      <div class="form-group d-inline-block col-3" style="padding-left: 5px;">
        <label for="friend_gifts_attributes_${this.giftCounter}_price">Price</label>
        <input type="number" name="friend[gifts_attributes][${this.giftCounter}][price]" step="0.01" class="form-control">
      </div>

      <div class="form-group d-inline-block col-3" style="padding-left: 5px;">
        <label for="friend_gifts_attributes_${this.giftCounter}_link">Link</label>
        <input type="text" name="friend[gifts_attributes][${this.giftCounter}][link]" class="form-control">
      </div>

      <div class="col-1 d-inline-block" style="text-align: center;">
        <button type="button" class="btn btn-danger remove-gift d-inline-block" style="width: 55px;" data-action="click->friends#removeGift">X</button>
      </div>
    `;

    this.giftsTarget.appendChild(giftFields);
    this.giftCounter++;
  }

  removeGift(event) {
    event.preventDefault();
    event.target.closest(".gift-fields").remove();
  }

  removeExistingGift(event) {
    event.preventDefault();
    const giftFields = event.target.closest(".gift-fields");
    giftFields.querySelector("input[name*='_destroy']").value = 1;
    giftFields.style.display = "none";
  }

}