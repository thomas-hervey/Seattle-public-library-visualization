PFont font;
String[] seasonLabels;
String highlightYear;

private void drawAxisLabelsOrder(){
  drawHUD();
  drawXLabelsOrder();
  drawYLabelsOrder();
  drawZLabelsOrder();
}

private void drawXLabelsOrder(){
  for(int i=0; i<numRows/100; i++){
    String pubDate = dataRecords[i*100].publishDate;
    stroke(255);
    fill(255);
    pushMatrix();
    text(pubDate, i*300 - leftOffset, -20, 1000);
    popMatrix();
    pushMatrix();
    rotateY(PI);
    text(pubDate, i*-300 + leftOffset, -20, 20);
    popMatrix();
  }
}

private void drawYLabelsOrder(){
  pushMatrix();
  if(isSqrt == true){
    for(int i=0; i<20; i++){
      stroke(255);
      fill(255);
      text((int)yAxisSqrtMapped[i], -leftOffset, -yAxisSqrtMapped[i], 1000);
      text((int)yAxisSqrtMapped[i], leftOffset,  -yAxisSqrtMapped[i], 0);
      text((int)yAxisSqrtMapped[i], leftOffset,  -yAxisSqrtMapped[i], 1000);
      text((int)yAxisSqrtMapped[i], -leftOffset, -yAxisSqrtMapped[i], 0);
    }
  } else {
    for(int i=0; i<20; i++){
      stroke(255);
      fill(255);
      text((int)yAxisSqrtMapped[i], -leftOffset, -yAxisMapped[i], 1000);
      text((int)yAxisSqrtMapped[i], leftOffset,  -yAxisMapped[i], 0);
      text((int)yAxisSqrtMapped[i], leftOffset,  -yAxisMapped[i], 1000);
      text((int)yAxisSqrtMapped[i], -leftOffset, -yAxisMapped[i], 0);
    }
  }
  popMatrix();
}

private void drawZLabelsOrder(){
  pushMatrix();
  //rotateY(-PI/2);
  //rotateZ(PI/2);
  for(int i=0; i<10; i++){
    stroke(255);
    fill(255);
    textAlign(CENTER, CENTER);
    text(2006+i, leftOffset, 20, dataRecords[0].yearMapped[i]);
    text(2006+i, -leftOffset, 20, dataRecords[0].yearMapped[i]);
  }
  popMatrix();
}

private void drawAxisLabelsSeason(){
  drawHUD();
  drawYLabelsSeason();
}

private void drawYLabelsSeason(){
  pushMatrix();
  textAlign(CENTER, CENTER);
  emissive(255);
  fill(255);
  stroke(255);
  strokeWeight(12);
  for(int i=0; i<12; i++){
    text(seasonLabels[i], 0, -20, 500);
    rotateY((-2*PI)/12.0);
  }
 popMatrix();
}

private void drawHUD(){
  cam.beginHUD();
  if(drawImages == true){ drawImages(); }
  drawTitle();
  drawDetails();
  drawCredits();
  cam.endHUD();
}

void drawImages(){
  if(imageNumber == 1){
    image(image1, width/2, height/2);
  } else if(imageNumber == 2){
    image(image2, width/2, height/2);
  } else if(imageNumber == 3){
    image(image3, width/2, height/2);
  }
}

private void drawTitle(){
  textAlign(LEFT, CENTER);
  strokeWeight(24);
  fill(255);
  stroke(255);
  text("Visualizing SPL Book Age, Popularity and Adoption Rates", -300, 30);
}

private void drawDetails(){
  textAlign(LEFT, CENTER);
  strokeWeight(60);
  fill(255);
  stroke(255);
  text("Color Representation: "+ color_representation, -300, 100);
  text("Time Representation: "+timeRepresentation, -300, 100 + 20);
  text("Normalized: "+isSqrt, -300, 100 + 40);
  
  if(isHighlighting == true){
    text("Title: "+dataRecords[highlightCounter].title, -300, 100 + 60);
    text("Dewey Number: "+dataRecords[highlightCounter].deweyNumber, -300, 100 + 80);
    text("Dewey Category: "+dataRecords[highlightCounter].deweyCategory, -300, 100 + 100);
    text("Total Checkouts: "+dataRecords[highlightCounter].totalCheckout, -300, 100 + 120);

    // * could be cleaner *
    if(dataRecords[highlightCounter].y2006 < 10000){
      text(dataRecords[highlightCounter].y2006, -300, 100 + 140);
    } else { text("_", -300, 100 + 140); }
    if(dataRecords[highlightCounter].y2007 < 10000){
      text(dataRecords[highlightCounter].y2007, -280, 100 + 140);
    } else { text("_", -280, 100 + 140); }
    if(dataRecords[highlightCounter].y2008 < 10000){
      text(dataRecords[highlightCounter].y2008, -260, 100 + 140);
    } else { text("_", -260, 100 + 140); }
    if(dataRecords[highlightCounter].y2009 < 10000){
      text(dataRecords[highlightCounter].y2009, -240, 100 + 140);
    } else { text("_", -240, 100 + 140); }
    if(dataRecords[highlightCounter].y2010 < 10000){
      text(dataRecords[highlightCounter].y2010, -220, 100 + 140);
    } else { text("_", -220, 100 + 140); }
    if(dataRecords[highlightCounter].y2011 < 10000){
      text(dataRecords[highlightCounter].y2011, -200, 100 + 140);
    } else { text("_", -200, 100 + 140); }
    if(dataRecords[highlightCounter].y2012 < 10000){
      text(dataRecords[highlightCounter].y2012, -180, 100 + 140);
    } else { text("_", -180, 100 + 140); }
    if(dataRecords[highlightCounter].y2013 < 10000){
      text(dataRecords[highlightCounter].y2013, -160, 100 + 140);
    } else { text("_", -160, 100 + 140); }
    if(dataRecords[highlightCounter].y2014 < 10000){
      text(dataRecords[highlightCounter].y2014, -140, 100 + 140);
    } else { text("_", -140, 100 + 140); }
    if(dataRecords[highlightCounter].y2015 < 10000){
      text(dataRecords[highlightCounter].y2015, -120, 100 + 140);
    } else { text("_", -120, 100 + 140); }
    
    text("Adoption [days]: "+dataRecords[highlightCounter].adoption, -300, 100 + 160);
  }
  for (int i=0; i<dataRecords.length; i+=100){
    if(i >= lowerOrderBound && i <= upperOrderBound){
      fill(255);
      stroke(255);
    } else {
      fill(100);
      stroke(100);
    }
    strokeWeight(8);
    ellipse(width/2 + (i*30/100) , 30, .5, .5);
  }
  for (int j=0; j<10; j++){
    if(j >= lowerYearBound && j <= upperYearBound){
      fill(255);
      stroke(255);
    } else {
      fill(100);
      stroke(100);
    }
    strokeWeight(8);
    ellipse(width-70, height/2 + -30*j, .5, .5);
  }
  
}

private void drawCredits(){
  emissive(100); 
  textSize(14);
  textAlign(RIGHT, CENTER);
  text("Mat 259 3D Project", width - 70, 930);
  text("Winter 2016", width - 70, 950);
  text("Thomas Hervey", width - 70, 970);
}