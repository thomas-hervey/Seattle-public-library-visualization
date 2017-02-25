//**************************************** //
//**        Display Manipulation        ** //
//**************************************** //

//// toggle 'x' variable
//void checkXVariable(int i){
// if(x_variable == "age"){
//   valX = dataPoints[i].age;
//   start1_X = min_age;
//   stop1_X = max_age;
//   start2_X = margin;
//   stop2_X = margin + (width - margin*2);
// }
// else if(x_variable == "relative_age"){
//   valX = dataPoints[i].relative_age;
//   start1_X = min_relative_age;
//   stop1_X = max_relative_age;
//   start2_X = margin;
//   stop2_X = margin + (width - margin*2);
// }
//}

//// toggle 'y' variable
//void checkYVariable(int i){
// if(y_variable == "full_frequency"){
//   valY = dataPoints[i].fullFrequency;
//   start1_Y = min_fullFrequency;
//   stop1_Y = max_fullFrequency;
//   start2_Y = (height - margin*2) + margin;
//   stop2_Y = margin;
// }
// else if(y_variable == "partial_frequency"){
//   valY = dataPoints[i].partialFrequency;
//   start1_Y = min_partialFrequency;
//   stop1_Y = max_partialFrequency;
//   start2_Y = (height - margin*2) + margin;
//   stop2_Y = margin;
// }
//}

//// toggle 'z' variable
//void checkZVariable(int i){
// if(z_variable == "adoption"){
//   valZ = dataPoints[i].adoption;
//   start1_Z = min_adoption;
//   stop1_Z = max_adoption;
//   start2_Z = (height - margin*2) + margin;
//   stop2_Z = margin;
// }
// else if(z_variable == "adoption2"){
//   println("poop");
// }
//}



//// **************************************** //
//// **          Draw Assistance           ** //
//// **************************************** //

//void drawBoarders(){
// fill(100);
// rect(0,0,margin,height);
// rect(0,0,width,margin);
// rect(0,height-margin,width,margin);
// rect(width-margin,margin,margin,height);
//}

//void drawLabels(){
// rect(0,0, margin, height);
// fill(50);
//}

//void drawTitles(){
// textAlign(LEFT, CENTER);
// textSize(12);
// fill(200);
// text("Book Age (days)", width/2, .5*margin);
// text("Checkout Frequency (occurances)", margin*2, height/2);
//}

//void drawAxis(){
// float x_axis_distance = (stop2_X - start2_X) / 10;
// float y_axis_distance = (start2_Y - stop2_Y) / 10;

// float x_axis_value = (stop1_X - start1_X) / 10;
// float y_axis_value = (stop1_Y - start1_Y) / 10;

// // print x axis
// for(int k=1; k<11; k++){
//   textAlign(CENTER, CENTER);
//   textSize(8);
//   fill(200);
//   text(k*x_axis_value, k*x_axis_distance, margin*2);
// }

// // print y axis
// for(int l=1; l<11; l++){
//   textAlign(CENTER, CENTER);
//   textSize(8);
//   fill(200);
//   text(l*y_axis_value, margin+20, height - (l*y_axis_distance));
// }

//}

//void drawInformation(){
// textSize(20);
// rotate(.5);
// translate(-100, -1*height/1.5 + 50);
// textAlign(CENTER, CENTER);
// text("Are Books Still Prevelant in an e-Media World?", 5*(width/6), margin*6);
// textSize(12);

// if(x_variable.equals("age")){ text("X-Variable: Age", 5*(width/6), margin*7); }
// else {text("X_Variable: Relative Age", 5*(width/6), margin*7);}

// if(y_variable.equals("full_frequency")){ text("Y-Variable: Checkout Frequency", 5*(width/6), margin*8); }
// else {text("Y_Variable: Relative Checkout Frequency", 5*(width/6), margin*8);}

// if(color_representation.equals("bookType")){ text("Color Range: Book Type", 5*(width/6), margin*9); }
// else{ text("Color Range: Publication Date", 5*(width/6), margin*9); }
//}







//if(age < min_age)                           {min_age = age;}
//  if(relative_age < min_relative_age)         {min_relative_age = relative_age;}
//  if(fullFrequency < min_fullFrequency)       {min_fullFrequency = fullFrequency;}
//  if(partialFrequency < min_partialFrequency) {min_partialFrequency = partialFrequency;}
//  if(publishOrder < min_publishOrder)         {min_publishOrder = publishOrder;}
//  if(adoption < min_adoption)                 {min_adoption = adoption;}

//  // get max values
//  if(age > max_age)                           {max_age = age;}
//  if(relative_age > max_relative_age)         {max_relative_age = relative_age;}
//  if(fullFrequency > max_fullFrequency)       {max_fullFrequency = fullFrequency;}
//  if(partialFrequency > max_partialFrequency) {max_partialFrequency = partialFrequency;}
//  if(publishOrder > max_publishOrder)         {max_publishOrder = publishOrder;}
//  if(adoption > max_adoption)                 {max_adoption = adoption;}










//int adoptionStart;
//color dataPointColor;


//float leftOffset;

//int numRecordsToDraw;
//int ms;
//int start;

//void draw() {
//  background(0);
  
//  if(timeRepresentation == "publicationOrder"){ drawRecords();}
//  //if(timeRepresentation == "publicationSeason"){ drawRecords2();}
  
//  drawPlatform();
//  drawLabels();
  
//}

//void drawRecords(){
  
//  //if(drawEachRecord == true){
//  //  ms = millis()-start;
//  //  numRecordsToDraw = ms/500;
//  //  if(numRecordsToDraw > dataRecords.length) { numRecordsToDraw = dataRecords.length; }
//  //} else { numRecordsToDraw = dataRecords.length; }
    
//  // iterate over records
//  for (int i=0; i<numRecordsToDraw; i++){
    
//    adoptionStart = 0;
    
//    // iterate over each point in record
//    for (int j=0; j<10; j++){
//      if(dataRecords[i].countMapped[j] > 0){
//        strokeWeight(5);
//        fill(dataRecords[i].dataPointColor);
//        stroke(dataRecords[i].dataPointColor);
//        pushMatrix();
//        //println(dataRecords[i].pubMapped[j], dataRecords[i].countMapped[j], dataRecords[i].yearMapped[j]);
//        translate(dataRecords[i].pubDayMapped - leftOffset, -dataRecords[i].countMapped[j], dataRecords[i].yearMapped[j]);
//        point(0,0,0);
//        popMatrix();
//        //checkMousePosition(dataRecords[i].pubMapped[j] - leftOffset, -dataRecords[i].countMapped[j], dataRecords[i].yearMapped[j], dataRecords[i]);
        
//        // draw lines between points
//        if(j<9){
//          stroke(dataRecords[i].dataPointColor);
//          strokeWeight(1);
//          line(dataRecords[i].pubMapped - leftOffset, -dataRecords[i].countMapped[j], dataRecords[i].yearMapped[j], dataRecords[i].pubMapped - leftOffset, -dataRecords[i].countMapped[j+1], dataRecords[i].yearMapped[j+1]);
//        }
      
//      }
    
//    }
    
//    // draw adoption line
//    strokeWeight(1);
//    stroke(0,255,0);
//    fill(0,255,0);
//    //println("I: ", i, " adp: ", dataRecords[i].adoptionMapped);
//    line(dataRecords[i].pubMapped - leftOffset, 0, 1000, dataRecords[i].pubMapped - leftOffset, 0, 1000+dataRecords[i].adoptionMapped);

      
//  }
//}


//void drawRecords2(){
//  for (int i=0; i<numRecordsToDraw; i++){
    
//    // draw adoption line
//    strokeWeight(1);
//    stroke(0,255,0);
//    fill(0,255,0);
//    //println("I: ", i, " adp: ", dataRecords[i].adoptionMapped);
//    line(dataRecords[i].pubMapped - leftOffset, 0, 1000, dataRecords[i].pubMapped - leftOffset, 0, 1000+dataRecords[i].adoptionMapped);

//  }
//}

//void drawPlatform(){
//  rotateX(PI/2);
//  stroke(100);
//  fill(100);
//  translate(0, 0, -5);
//  rect(-leftOffset, 0, 3*numRows, 1000);
//  noStroke();
//}

////void checkMousePosition(float posX, float posY, float posZ, DataRecord d){
////  if(mouseX >= posX - hoverDistance && mouseX <= posX + hoverDistance  && mouseY >= posY - hoverDistance && mouseY <= posY + hoverDistance){
////    d.displayTitle(posX, posY, posZ);
////    println("hover worked!");
////    //d.displayLabel();
////    //if(color_representation == "bookType"){
////    //  String bookType = d.itemType;
////    //  d.setColor(i, bookType);
////    //}
////  } else {
    
////    //d.setColor(i, "null");
////  }
////}