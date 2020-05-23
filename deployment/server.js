var path = require('path');
var express = require('express');

var app = express();

const PORT = process.env.PORT || 3030;

app.set(PORT, 3030);  
app.use(express.static(__dirname + '/public'));

app.listen(PORT, function(err) {
  if (err) {
    return console.error(err);
  }
  
  console.log('Listening at http://localhost:3030/');
});
