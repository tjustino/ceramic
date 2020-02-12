import { once_ready } from 'once_ready';

once_ready(function(){
  (document.querySelectorAll('.notification .delete') || []).forEach(
    (to_delete) => {
      var notification = to_delete.parentNode;
      to_delete.addEventListener('click', () => {
        notification.parentNode.removeChild(notification);
    });
  })
});

// view-source:https://bulma.io/lib/main.js?v=202001311336
// function closeModals() {
//   rootEl.classList.remove('is-clipped');
//   $modals.forEach(function ($el) {
//     $el.classList.remove('is-active');
//   });
// }
