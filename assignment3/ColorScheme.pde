PImage colorBar;
String[] colorPath = {"bwReBlend129h.jpg", "bwReBlend129d.jpg"};
color c = color(255, 204, 0);
String color_representation;

void setColorScheme(DataRecord d){
  if(color_representation == "publish_order"){ // initial colors
    colorBar = loadImage(colorPath[0]);
    d.dataPointColor = colorBar.get((int)map(d.pubOrderMapped/3, min_publishOrder, 
                       max_publishOrder, 2, colorBar.width-2), colorBar.height/2);
    d.highlightorColor = color(255);
  }
  else if(color_representation == "total_checkout"){
    colorBar = loadImage(colorPath[0]);
    d.dataPointColor = colorBar.get((int)map(d.totalCheckout, min_totalCheckout, 
                       max_totalCheckout, 2, colorBar.width-2), colorBar.height/2);
  }
  else if(color_representation == "dewey_number"){
    colorBar = loadImage(colorPath[1]);
    d.dataPointColor = colorBar.get((int)map(d.deweyNumber, min_deweyNumber, 
                       max_deweyNumber, 2, colorBar.width-2), colorBar.height/2);
  }
  else { d.dataPointColor = color(200); }
  
  d.adoptionLineColor = color(0,255,0);
}

String getColorSchemeText(){ return "Color scheme: " + color_representation; }

void toggleHighlighted(int highlightNumber){
  if(isHighlighting == true){
    for(int i=0; i<upperOrderBound-lowerOrderBound; i++){
      dataRecords[i].isHighlighted = false;
      dataRecords[i].strokeWeight = 5;
    }
    dataRecords[highlightNumber].isHighlighted = true;
    dataRecords[highlightCounter].strokeWeight = 10;
  } else { println("isHighlighting == false"); }
}