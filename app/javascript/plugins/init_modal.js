const initModal = () => {
  // Get the modal

  // Get the button that opens the modal
  const modals = document.getElementsByClassName("modal");
  const btns = document.getElementsByClassName("modalBtn");

  // Get the <span> element that closes the modal
  const spans = document.getElementsByClassName("close");

  // When the user clicks on the button, open the modal
  [...btns].forEach((btn) => {
    btn.onclick = () => {
      const modal = document.getElementsByName(btn.id)[0];
      console.log("hello")
      modal.style.display = "block";
    }
  });
  // When the user clicks on <span> (x), close the modal
  [...spans].forEach((span) => {
    span.onclick = () => {
      [...modals].forEach((modal) => {
        modal.style.display = "none";
      })
    }
  });

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    [...modals].forEach((modal) => {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    })
  }
}

export { initModal };
