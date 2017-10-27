var appVersion = '<version>';

var DONE = 4;
var OK = 200;

setInterval(function () {
  var xhr = new XMLHttpRequest();
  xhr.open('GET', '/api/get-color');
  xhr.send(null);

  xhr.onreadystatechange = function () {
    if (xhr.readyState === DONE) {
      if (xhr.status === OK) {
        var payload = JSON.parse(xhr.responseText);

        if (payload.version === appVersion) {
          document.getElementsByTagName("body")[0]
            .style.backgroundColor= payload.color;
        } else {
          window.location.reload(true);
        }
      } else {
        console.log('Error: ' + xhr.status);
      }
    }
  };
}, 1000);
