submitForms = function() {
  //see what areas are filled in and what are not
  var places = [];
  var rows = document.getElementsByClassName("places-table")[0].children[0].children[0].children
  for (i=3; i<(rows.length-1); i++) {
    var rowElements = rows[i].children;
    index = i-3;
    places[index] = 0;
    for (j=1; j<rowElements.length; j++) {
      var schoolId = rowElements[j].children[0].value; //This will be '0' for nobody, and the school id for anyting else
      if (schoolId != 0) {
        places[index] += 1;
      }

    }
  }

  var sum = 0;
  for (i=0; i<places.length; i++) {
    sum += places[i];
  }
  //check to see if there are too many
  if (sum>6)  {
    alert("You entered "+sum+" winners. Please remove some. There should only be 6.");
    return;
  }

  //determine if ties make sense depending on how user input results
  for (i=0; i<(places.length-1); i++) {
    if (places[i]>1) {
      for (j=i+1; j<=((i+1)+(places[i]-2)); j++) {
        if (places[j] != 0) {
          alert("These ties do not make sense. Try relooking at it");
          return
        }
      }
    }
  }

  //find button used to submit form created by rails; and click this button
  button = document.getElementsByClassName('rails-btn')[0];
  button.click();
}