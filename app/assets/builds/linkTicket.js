(() => {
  // app/javascript/linkTicket.js
  document.getElementById("copy-ticket-link").addEventListener("click", function(event) {
    event.preventDefault();
    var ticketLink = this.getAttribute("href");
    navigator.clipboard.writeText(ticketLink);
    alert("Link copiado para a \xE1rea de transfer\xEAncia: " + ticketLink);
  });
})();
//# sourceMappingURL=/assets/linkTicket.js.map
