import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'swatch',
    'meatballButton',
    'prevButton',
    'nextButton',
    'swatchRail',
  ];

  static values = { index: Number };

  initialize() {
    this.connected = false;
    this.indexValueChanged();
  }

  indexValueChanged() {
    this.moveSwatch();
    this.updateMoveButtons();
    this.updateMeatballs();
  }

  swatchTargetConnected() {
    if (this.connected) {
      this.moveSwatch();
      this.removeFirstSwatch();
    }
  }

  connect() {
    this.connected = true;
    this.startSlideShow();
  }

  prevSwatch() {
    this.indexValue--;
  }

  nextSwatch() {
    this.indexValue++;
  }

  startSlideShow() {
    const slideshow = setInterval(() => {
      if (this.indexValue < 2) {
        this.indexValue++;
      } else {
        clearInterval(slideshow);
      }
    }, 3000);
  }

  moveSwatch() {
    // this.swatchRailTarget.style.transform = `translateY(${-100 * this.indexValue}%)`;

    this.swatchTargets.forEach((swatch) => {
      swatch.style.transform = `translateY(${-100 * this.indexValue}%)`;
    });
  }

  moveByIndex(event) {
    this.indexValue = event.params.swatchIndex;
  }

  removeFirstSwatch() {
    this.swatchTargets[0].classList.add('removing');

    setTimeout(() => {
      this.swatchTargets[0].remove();
    }, 300);
  }

  updateMoveButtons() {
    if (this.indexValue <= 0) {
      this.prevButtonTarget.classList.add('disabled');
      this.nextButtonTarget.classList.remove('disabled');
    } else if (this.indexValue >= this.swatchTargets.length - 1) {
      this.prevButtonTarget.classList.remove('disabled');
      this.nextButtonTarget.classList.add('disabled');
    } else {
      this.nextButtonTarget.classList.remove('disabled');
      this.prevButtonTarget.classList.remove('disabled');
    }
  }

  updateMeatballs() {
    this.meatballButtonTargets.forEach((meatballButton, index) => {
      if (index == this.indexValue) {
        meatballButton.classList.add('current');
      } else {
        meatballButton.classList.remove('current');
      }
    });
  }
}
