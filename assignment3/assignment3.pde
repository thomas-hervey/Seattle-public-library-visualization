import peasy.*;
PeasyCam cam;

//String time = ""; // threading variable
String dataFile = "FINAL_working.csv"; // data source

PImage image1, image2, image3;

void setup() {
  size(1000, 1000, P3D); // set up window
  smooth();
  surface.setResizable(true); // make the screen resizable
  cam = new PeasyCam(this, 200); // set up camera
  cam.setMinimumDistance(50);
  cam.setResetOnDoubleClick(false);
  
  loadData(dataFile); // load data
  initialize(); // set initial visualization conditions
}

private void initialize(){
  leftOffset = 1.5*numRows; // offset everything so peasycam is in center
  upperOrderBound = dataRecords.length; // initially draw all records
  color_representation = "publish_order"; // initial color scheme
  timeRepresentation = "publicationOrder"; // initial time representation
  drawEachRecord = false;
  isHighlighting = false;
  isSqrt = false;
  isJitter = false;
  highlightCounter = 800;
  highlightChange = 1;
  font = createFont("SukhumvitSet-SemiBold", 30, true);
  textFont(font); // set up HUD and labeling font
  yAxisMapped = new float[20]; // initialize yAxis values
  yAxisSqrtMapped = new float[20]; // initialize yAxisSqrt values
  seasonLabels = new String[] {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
  
  imageNumber = 0;
  image1 = loadImage("publish_v_fCheckOut.png");
  image2 = loadImage("annual_checkout_vs2.png");
  image3 = loadImage("adoption2.png");
  
  lowerOrderBound = 0; // initial lower record order bound to draw
  upperOrderBound = dataRecords.length; // initial lower record order bound to draw
  lowerYearBound = 0; // initial lower year bound to draw
  upperYearBound = 9; // initial upper year bound to draw
  
  // map axis values
  for(int i=0; i<20; i++){
    yAxisMapped[i] = (float)map((float)i/20*max_checkout, min_checkout, max_checkout, 0, 1000);
    yAxisSqrtMapped[i] = (float)map((float)Math.sqrt((float)i/20*max_checkout), (float)Math.sqrt(min_checkout), (float)Math.sqrt(max_checkout), 0, 1000);
  }

  // for each data record, map their values & set initial colors
  for(int i=0; i< dataRecords.length; i++){
    dataRecords[i].mapValues();
    setColorScheme(dataRecords[i]);
  }
  
}

// transforms for rescaling (histogram)
// find variables that may predict adoption spikes or abnormalities 
// *seasonality (of adoption) maybe as a regression parameter - possible low frequency trend      = b0 + b1(time) + b2(topic)
// have 12 dummy variables for each month
// are these best sellers or is there something else?
// *dewey categories

// take root (or .1 root) -> bring data up