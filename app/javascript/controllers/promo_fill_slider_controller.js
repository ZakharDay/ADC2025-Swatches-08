import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'fill',
    'meatballButton',
    'prevButton',
    'nextButton',
    'fillRail',
  ];

  static values = { index: Number };

  initialize() {
    this.connected = false;
    this.indexValueChanged();
  }

  indexValueChanged() {
    this.moveFill();
    this.updateMoveButtons();
    // this.updateMeatballs();
  }

  fillTargetConnected() {
    if (this.connected) {
      this.moveFill();
      this.removeFirstFill();
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
      if (this.indexValue < 8) {
        this.indexValue++;
      } else {
        clearInterval(slideshow);
      }
    }, 3000);
  }

  moveFill() {
    // this.swatchRailTarget.style.transform = `translateY(${-100 * this.indexValue}%)`;

    this.fillTargets.forEach((fill) => {
      fill.style.transform = `translateX(${-149 * this.indexValue}px)`;
    });
  }

  // moveByIndex(event) {
  //   this.indexValue = event.params.swatchIndex;
  // }

  removeFirstFill() {
    this.fillTargets[0].classList.add('removing');

    setTimeout(() => {
      this.fillTargets[0].remove();
    }, 300);
  }

  updateMoveButtons() {
    if (this.indexValue <= 0) {
      this.prevButtonTarget.classList.add('disabled');
      this.nextButtonTarget.classList.remove('disabled');
    } else if (this.indexValue >= this.fillTargets.length - 4) {
      this.prevButtonTarget.classList.remove('disabled');
      this.nextButtonTarget.classList.add('disabled');
    } else {
      this.nextButtonTarget.classList.remove('disabled');
      this.prevButtonTarget.classList.remove('disabled');
    }
  }

  // updateMeatballs() {
  //   this.meatballButtonTargets.forEach((meatballButton, index) => {
  //     if (index == this.indexValue) {
  //       meatballButton.classList.add('current');
  //     } else {
  //       meatballButton.classList.remove('current');
  //     }
  //   });
  // }
}
