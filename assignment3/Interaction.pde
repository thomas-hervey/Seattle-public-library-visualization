boolean drawEachRecord;
boolean isHighlighting;
boolean isSqrt;
boolean isJitter;
boolean drawImages;
int imageNumber;
int highlightCounter;
int highlightChange;
String timeRepresentation;

void keyPressed() {
  if(keyCode == SHIFT){
    if(timeRepresentation == "publicationOrder"){timeRepresentation = "publicationSeason";}
    else if(timeRepresentation == "publicationSeason"){timeRepresentation = "publicationOrder";}
    drawEachRecord = false;
  }
  
  if(key == '6' || key == '7' || key == '8' || key == '9'){
      isHighlighting = true;
      if(key == '6'){ highlightCounter -= 20; } // decrement highlighter (20)
      if(key == '7'){ highlightCounter -= 1; } // decrement highlighter (1)
      if(key == '8'){ highlightCounter += 1; } // increment highlighter (1) 
      if(key == '9'){ highlightCounter += 20; } // increment highlighter (20) 
      
      if(highlightCounter < lowerOrderBound){ highlightCounter = lowerOrderBound; }
      if(highlightCounter > upperOrderBound){ highlightCounter = upperOrderBound; }
      toggleHighlighted(highlightCounter); // highlight record
    }
    if(key == '0'){ isHighlighting = false; toggleHighlighted(highlightCounter);
      dataRecords[highlightCounter].strokeWeight = 5; highlightCounter = 800; } // turn off highlighting
    
    // draw record number interaction
    if(key == 'Q' || key == 'q' || key == 'W' || key == 'w' || key == 'E' || key == 'e' || key == 'R' || key == 'r' // manipulate year drawing
    || key == 'U' || key == 'u' || key == 'I' || key == 'i' || key == 'O' || key == 'o' || key == 'P' || key == 'p' // manipulate order drawing
    || key == 'T' || key == 't' || key == 'Y' || key == 'y'){ // reset drawing bounds
    
      // alter order boundaries
      if((key == 'Q' || key == 'q') && lowerOrderBound >= 1){ lowerOrderBound -= 10; } // decrease order lower bound
      if((key == 'W' || key == 'w') && lowerOrderBound <= upperOrderBound - 20){ lowerOrderBound += 10; } // increase order lower bound
      if((key == 'E' || key == 'e') && upperOrderBound >= lowerOrderBound + 20){ println("before: "+ upperOrderBound); upperOrderBound -= 10; println("after: "+ upperOrderBound);} // decrease order upper bound
      if((key == 'R' || key == 'r') && upperOrderBound <= dataRecords.length - 1){ upperOrderBound += 10; } // increase order upper bound
      // alter year boundaries
      if((key == 'O' || key == 'o') && lowerYearBound <= upperYearBound - 2){ lowerYearBound += 1; } // increase year lower bound
      if((key == 'P' || key == 'p') && lowerYearBound >= 1){ lowerYearBound -= 1; } // decrease year lower bound
      if((key == 'U' || key == 'u') && upperYearBound <= 8){ upperYearBound += 1; } // increase year upper bound
      if((key == 'I' || key == 'i') && upperYearBound >= lowerYearBound + 2){ upperYearBound -= 1; } // decrease year upper bound
      // reset records
      if(key == 'T' || key == 't' || key == 'Y' || key == 'y') { lowerOrderBound = 0; upperOrderBound = dataRecords.length; lowerYearBound = 0; upperYearBound = 9; } // reset drawing bounds
      
      println("lower year bound: ", lowerYearBound, "upper year bound: ", upperYearBound);
      println("lower order bound: ", lowerOrderBound, "upper order bound: ", upperOrderBound);
    }
    
    
  if(timeRepresentation == "publicationOrder"){
    if(key == '1'){
      color_representation = "total_checkout";
      for(int i=0; i<numRows; i++){ setColorScheme(dataRecords[i]); }
    }
    if(key == '2'){
      color_representation = "dewey_number";
      for(int i=0; i<numRows; i++){ setColorScheme(dataRecords[i]); }
    }
    if(key == '3'){
      if(drawEachRecord == true){ drawEachRecord = false; upperOrderBound = dataRecords.length; }
      else if(drawEachRecord == false){ drawEachRecord = true; }
    }
    if(key == '4'){
      if(isSqrt == true){ isSqrt = false; }
      else if(isSqrt == false){ isSqrt = true; }
    }
    if(key == '5'){
      if(isJitter == true){ isJitter = false; }
      else if(isJitter == false){ isJitter = true; }
    }
    if(keyCode == ALT){
      imageNumber += 1;
      drawImages = true;
      if(imageNumber >= 4){ imageNumber = 0; drawImages = false; }
    }
  }
  else if(timeRepresentation == "publicationSeason"){
  }
  else { println("other key pressed: ", key); }
}