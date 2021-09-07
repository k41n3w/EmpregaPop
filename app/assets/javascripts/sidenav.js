$(document).on('ready turbolinks:load', function() {
  var elem, instance;
  elem = document.querySelector('#side-nav');
  return instance = new M.Sidenav(elem, {});
});
 
$(document).on('ready turbolinks:before-visit', function() {
  var elem, instance;
  elem = document.querySelector('#side-nav');
  instance = M.Sidenav.getInstance(elem);
  return instance.destroy();
});
