import { once_ready } from 'once_ready';

once_ready(function(){
  var meta_tags = document.getElementsByClassName('meta-tag');

  for (var i = 0; i < meta_tags.length; i++) {
    meta_tags[i].onclick = function () {
      if (this.firstChild.className == "far fa-plus-square"){
        this.firstChild.className = "far fa-minus-square";
        this.nextSibling.style.display = 'flex';
      } else {
        this.firstChild.className = "far fa-plus-square";
        this.nextSibling.style.display = '';
      }
    }
  }
});
