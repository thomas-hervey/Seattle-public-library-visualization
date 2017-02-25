// data loading
Table table;
int numRows, numCols;
DataRecord[] dataRecords;

// setting min | max
int min_publishOrder, min_checkout, min_adoption, min_totalCheckout, min_deweyNumber = 10000;
int max_publishOrder, max_checkout, max_adoption, max_totalCheckout, max_deweyNumber = 0;
int min_year = 2006;
int max_year = 2015;

float leftOffset;

float[] yAxisMapped, yAxisSqrtMapped;

// **************************************** //
// **           Data Loading             ** //
// **************************************** //

void loadData(String dataFile){
  
  // load data into table
  table = loadTable(dataFile, "header"); // put data into Processing table from csv
  numRows = table.getRowCount(); // get number of data points
  numCols = table.getColumnCount(); // get number of attributes per data point
  
  // create data points and fill array
  dataRecords = new DataRecord[numRows]; // initialize data points array length
  int counter = 0;
  for (TableRow row : table.rows()) {
    createDataPoint(row, counter);
    counter += 1;
  } // table.clearRows();
}

// **************************************** //
// **           Data Creation            ** //
// **************************************** //

void createDataPoint(TableRow row, int counter){
  int bib              = row.getInt("bib");
  String bookType      = row.getString("bookType");
  String title         = row.getString("title");
  String publishDate   = row.getString("publishDate");
  int publishOrder     = row.getInt("publishOrder");    
  int adoption         = row.getInt("adoption");
  int publishDay       = row.getInt("publishDay");
  int fcheckoutDay     = row.getInt("fcheckoutDay");
  int ageFull          = row.getInt("ageFull");
  int ageCheckouts     = row.getInt("ageCheckouts");
  int n2006            = row.getInt("2006");
  int n2007            = row.getInt("2007");
  int n2008            = row.getInt("2008");
  int n2009            = row.getInt("2009");
  int n2010            = row.getInt("2010");
  int n2011            = row.getInt("2011");
  int n2012            = row.getInt("2012");
  int n2013            = row.getInt("2013");
  int n2014            = row.getInt("2014");
  int n2015            = row.getInt("2015");
  int totalCheckout    = row.getInt("totalCheckout");
  int deweyNumber      = row.getInt("deweyNumber");
  String deweyCategory = row.getString("deweyCategory");
  
  
  // ************************************************
  // Set min & max values for bounding mapping ranges
  // ************************************************
  
  // publishOrder min | max
  if(publishOrder < min_publishOrder){min_publishOrder = publishOrder;}
  if(publishOrder > max_publishOrder){max_publishOrder = publishOrder;}
  
  // checkout min | max
  int[] temp_YearArray = {n2006, n2007, n2008, n2009, n2010, n2011, n2012, n2013, n2014, n2015};
  temp_YearArray = sort(temp_YearArray);
  int checkoutMin = temp_YearArray[0];
  int checkoutMax = 0;
  for(int i = 0; i<temp_YearArray.length; i++){
    if(temp_YearArray[i] > checkoutMax && temp_YearArray[i] != 10000) { checkoutMax = temp_YearArray[i]; }
  }
  if(checkoutMin < min_checkout && checkoutMax < 10000){min_checkout = checkoutMin;}
  if(checkoutMax > max_checkout && checkoutMax <= 10000){max_checkout = checkoutMax;}
  
  // Adoption min | max
  if(adoption < min_adoption){min_adoption = adoption;}
  if(adoption > max_adoption){max_adoption = adoption;}
  
  // total checkout min | max
  if(totalCheckout < min_totalCheckout){min_totalCheckout = totalCheckout;}
  if(totalCheckout > max_totalCheckout){max_totalCheckout = totalCheckout;}
  
  // dewey number min | max
  if(min_deweyNumber > deweyNumber){min_deweyNumber = deweyNumber;}
  if(max_deweyNumber < deweyNumber){max_deweyNumber = deweyNumber;}
  
  
  // *************************************************
  // create new data point and add to dataPoints array
  // *************************************************
  
  dataRecords[counter] = new DataRecord(bib, bookType, title, publishDate, publishOrder, adoption, publishDay, 
  fcheckoutDay, ageFull, ageCheckouts, n2006, n2007, n2008, n2009, n2010, n2011, n2012, n2013, n2014, n2015, 
  totalCheckout, deweyNumber, deweyCategory);
  
}