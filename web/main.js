
App.onLaunch = function(options) {
    var mainURL = 'https://db.tt/rYiUsNJX';
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.responseType = "document";
    xmlhttp.onload = function () {
      navigationDocument.pushDocument(xmlhttp.responseXML);
    };
    xmlhttp.open("GET", mainURL, true);
    xmlhttp.send();
}

App.onExit = function() {
    console.log('App finished');
}
