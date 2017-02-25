// number of records to draw
int lowerOrderBound, upperOrderBound, lowerYearBound, upperYearBound;

// draw each record timer
int ms, start;
int buttonValue = 1;
float moveValue;


void draw() {
  background(0);
  checkJitter();
  
  if(timeRepresentation == "publicationOrder"){
    setupperOrderBound();
    drawRecordsOrder();
    drawPlatform();
    drawAxisLabelsOrder();
  }
  if(timeRepresentation == "publicationSeason"){
    setupperOrderBound();
    drawRecordsSeason();
    drawAxisLabelsSeason();
  }
}

void checkJitter(){
  if(isJitter == true){
    if(second() % 6 == 0){
      for(int a=0; a<upperOrderBound; a++){
        dataRecords[a].jitter = false;
      }
      for(int i=0; i<50; i++){
        dataRecords[(int)random(0, upperOrderBound)].jitter = true;
      }
    }
  }
}


void setupperOrderBound(){
  if(drawEachRecord == true){
    ms = millis()-start;
    upperOrderBound = ms/300;
    if(upperOrderBound >= dataRecords.length) { upperOrderBound = 0; }
  }
}

float theta = 0.0;  // Start angle at 0
float amplitude = 2.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues = new float[2000];  // Using an array to store height values for the wave

void drawRecordsOrder(){
  
  // iterate over records
  for (int i=lowerOrderBound; i<upperOrderBound; i++){
    
    // Increment theta (try different values for 'angular velocity' here
    theta += 0.02;
    // For every x value, calculate a y value with sine function
    float x = theta;
    
    // iterate over each point in record
    for (int j=lowerYearBound; j<upperYearBound; j++){
      
      yvalues[i] = sin(x)*amplitude;
      x+=dx;
      
      if(dataRecords[i].countMapped[j] < 10000){ // don't draw flat 0 points/lines
        // determine point color scheme
        if(dataRecords[i].isHighlighted == true){
          fill(dataRecords[i].highlightorColor);
          stroke(dataRecords[i].highlightorColor);
        } else {
          fill(dataRecords[i].dataPointColor);
          stroke(dataRecords[i].dataPointColor);
        }
        strokeWeight(dataRecords[i].strokeWeight);
        
        if(isJitter == true && dataRecords[i].jitter == true){ moveValue = yvalues[i]; }
        else { moveValue = 0; }
        
        // draw point
        if(isSqrt == true){ point(dataRecords[i].pubOrderMapped - leftOffset, -dataRecords[i].countMappedSqrt[j] + moveValue, dataRecords[i].yearMapped[j]); }
        else { point(dataRecords[i].pubOrderMapped - leftOffset, -dataRecords[i].countMapped[j] + moveValue, dataRecords[i].yearMapped[j]); }
        
        if(j<9){
          // determine line color scheme
          if(dataRecords[i].isHighlighted == true){
            fill(dataRecords[i].highlightorColor);
            stroke(dataRecords[i].highlightorColor);
          } else {
            fill(dataRecords[i].dataPointColor);
            stroke(dataRecords[i].dataPointColor);
          }
          strokeWeight((float)dataRecords[i].strokeWeight/5);
          
          // draw line
          if(isSqrt == true){
            line(dataRecords[i].pubOrderMapped - leftOffset, -dataRecords[i].countMappedSqrt[j] + moveValue, dataRecords[i].yearMapped[j], 
               dataRecords[i].pubOrderMapped - leftOffset, -dataRecords[i].countMappedSqrt[j+1] + moveValue, dataRecords[i].yearMapped[j+1]);
          } else {
            line(dataRecords[i].pubOrderMapped - leftOffset, -dataRecords[i].countMapped[j] + moveValue, dataRecords[i].yearMapped[j], 
               dataRecords[i].pubOrderMapped - leftOffset, -dataRecords[i].countMapped[j+1] + moveValue, dataRecords[i].yearMapped[j+1]);
          }
        }
      }
    }
    
    // draw adoption line
    if(dataRecords[i].isHighlighted == true){
      fill(dataRecords[i].highlightorColor);
      stroke(dataRecords[i].highlightorColor);
    } else {
      fill(dataRecords[i].adoptionLineColor);
      stroke(dataRecords[i].adoptionLineColor);
    }
    strokeWeight((float)dataRecords[i].strokeWeight/5);
    line(dataRecords[i].pubOrderMapped - leftOffset, 0, 1000, dataRecords[i].pubOrderMapped - leftOffset, 0, 1000+dataRecords[i].adoptionMapped);
    
  }
}

void drawPlatform(){
  pushMatrix();
  rotateX(PI/2);
  stroke(100);
  fill(100);
  rect(-leftOffset, 0, 3*numRows, 1000);
  noStroke();
  popMatrix();
}

void drawRecordsSeason(){
  // iterate over records
  for (int i=lowerOrderBound; i<upperOrderBound; i++){
    drawAdoption(i);
    //drawArcs(i);
  }
  
  // draw mean of adoption
  strokeWeight(3);
  stroke(255,0,0);
  noFill();
  pushMatrix();
  rotateX(PI/2);
  ellipse(0, 0, 1000+ 179.2147,1000+ 179.2147);
  stroke(0,0,255);
  ellipse(0, 0, 1000+ 68, 1000+ 68);
  popMatrix();
}

void drawAdoption(int i){
  // add jitter so same day values don't overlap
  if(i % 365 == 0){
    rotateY(((2*PI)/365.0)/10);
  }
  
  dataRecords[i].adoptionRotation = dataRecords[i].publishDay * (-2*PI)/365.0;
  rotateY(dataRecords[i].adoptionRotation); // rotate to position
  //draw adoption line
  strokeWeight(1);
  stroke(0,255,0);
  fill(0,255,0);
  pushMatrix();
  line(0, 0, 500, 0, 0, 500 + dataRecords[i].adoption);
  popMatrix();
  rotateY(dataRecords[i].publishDay * (2*PI)/365.0); // rotate back
}

//void drawArcs(int i){
//  strokeWeight(1);
//  stroke(255,0, 0);
//  noFill();
//  pushMatrix();
//  //rotateY(((2*PI)/365.0)/10);
//  //rotateX(PI/2);
//  rotateY(dataRecords[i].adoptionRotation);
//  //curve(0, 0, 500, );
//  //curve(0, 0, 500, 0, 0, 0, 0, 0, 0, , y4, z4);
  
//  //arc(0, 0, 1000, dataRecords[i].adoption, dataRecords[i].publishDay * (2*PI)/365.0, dataRecords[i].fcheckoutDay * (2*PI)/365.0, OPEN);
//  //arc(50, i*4, 80, 80, i*100, PI+QUARTER_PI, OPEN);
//  popMatrix();
//}