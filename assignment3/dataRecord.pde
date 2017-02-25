class DataRecord{

  int bib, isbn, publishOrder, publishDay, fcheckoutDay, ageFull, ageCheckouts, y2006, y2007, 
  y2008, y2009, y2010, y2011, y2012, y2013, y2014, y2015, totalCheckout, deweyNumber;
  float adoption;
  String bookType, title, publishDate, deweyCategory;
  color dataPointColor, adoptionLineColor, highlightorColor; // colors
  boolean isHighlighted = false;
  int strokeWeight = 5; // stroke weight
  
  boolean jitter = false;
  float adoptionRotation;
  
  // mapping arrays
  float[] countMapped; // y-value
  float[] countMappedSqrt; // y-value (sqrt)
  float[] yearMapped; // z-value
  float pubOrderMapped; // x-value (possible)
  float pubDayMapped; // x-value(possible)
  float checkoutDayMapped;
  float adoptionMapped = 0;

  DataRecord(int nbib, String nbookType, String ntitle, String npublishDate, 
    int npublishOrder, float nadoption, int npublishDay, int nfcheckoutDay, 
    int nageFull, int nageCheckouts, int n2006, int n2007, int n2008, int n2009, 
    int n2010, int n2011, int n2012, int n2013, int n2014, int n2015, int ntotalCheckout, 
    int ndeweyNumber, String ndeweyCategory){
    bib = nbib;
    bookType = nbookType;
    title = ntitle;
    publishDate = npublishDate;
    publishOrder = npublishOrder;
    adoption = nadoption;
    publishDay = npublishDay;
    fcheckoutDay = nfcheckoutDay;
    ageFull = nageFull;
    ageCheckouts = nageCheckouts;
    y2006 = n2006;
    y2007 = n2007;
    y2008 = n2008;
    y2009 = n2009;
    y2010 = n2010;
    y2011 = n2011;
    y2012 = n2012;
    y2013 = n2013;
    y2014 = n2014;
    y2015 = n2015;
    totalCheckout = ntotalCheckout;
    deweyNumber = ndeweyNumber;
    deweyCategory = ndeweyCategory;
  }

  void mapValues(){
    // initialize mapping values
    countMapped = new float[10];
    countMappedSqrt = new float[10];
    yearMapped = new float[10];
    pubOrderMapped = 0;
    pubDayMapped = 0;
    checkoutDayMapped = 0;

    // map data point's values to 2006 - 2015 annual range
    for (int j=0; j<10; j++){
      countMapped[j]     = (int)map(getYearCount(j), min_checkout, max_checkout, 0, 1000); // map yearly checkout count (y-value)
      countMappedSqrt[j] = (int)map((float)Math.sqrt(getYearCount(j)), (float)Math.sqrt(min_checkout), (float)Math.sqrt(max_checkout), 0, 1000); // map yearly checkout count (y-value)
      yearMapped[j]      = (int)map(getYear(j), min_year, max_year, 1000, 0); // map year (z-value)
    }
    pubOrderMapped = (int)map(publishOrder, min_publishOrder, max_publishOrder, 0, 3*numRows); // map pub order (x-value)
    pubDayMapped   = (int)map(publishDay, 0, 355, 0, 3*numRows); // map pub DoY (x-value)
    adoptionMapped = (int)map(adoption, min_adoption, max_adoption, 0, 1000); // map adoption
  }
  
  // countMapped mapping helper
  private int getYearCount(int j){
    int yearValue = 10000;
    switch (j) {
    case 0: return y2006;
    case 1: return y2007;
    case 2: return y2008;
    case 3: return y2009;
    case 4: return y2010;
    case 5: return y2011;
    case 6: return y2012;
    case 7: return y2013;
    case 8: return y2014;
    case 9: return y2015;
    } return yearValue;
  }
  
  // yearMapped mapping helper
  private int getYear(int j){
    int year = 10000;
    switch (j) {
    case 0: return 2006;
    case 1: return 2007;
    case 2: return 2008;
    case 3: return 2009;
    case 4: return 2010;
    case 5: return 2011;
    case 6: return 2012;
    case 7: return 2013;
    case 8: return 2014;
    case 9: return 2015;
    } return year;
  }

}