(() => {
  // app/javascript/closeModal.js
  document.addEventListener("keydown", function(event) {
    if (event.key === "Escape") {
      var modal = document.getElementById("staticBackdrop");
      var modalController = modal.getAttribute("data-controller");
      var modalControllerInstance = ApplicationController.getControllerForElementAndIdentifier(
        modal,
        modalController
      );
      if (modalControllerInstance) {
        modalControllerInstance.close();
      }
    }
  });
})();
//# sourceMappingURL=/assets/closeModal.js.map
