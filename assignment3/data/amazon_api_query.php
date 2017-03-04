<?php

$row = 1;
if (($handle = fopen("raw_isbn_4_1.csv", "r")) !== FALSE) {
    $data = fgetcsv($handle, 500000, ",");
    fclose($handle);
}


$arrayName = array();

// Your AWS Access Key ID, as taken from the AWS Your Account page
$aws_access_key_id = "";

// Your AWS Secret Key corresponding to the above ID, as taken from the AWS Your Account page
$aws_secret_key = "";

// The region you are interested in
$endpoint = "webservices.amazon.com";

$uri = "/onca/xml";

$counter = 0;
$time_pre = microtime(true);

foreach($data as $item){

  $params = array(
      "Service" => "AWSECommerceService",
      "Operation" => "ItemLookup",
      "AWSAccessKeyId" => "",
      "AssociateTag" => "",
      "ItemId" => (string)$item,
      "IdType" => "ISBN",
      "ResponseGroup" => "ItemAttributes",
      "SearchIndex" => "Books"
  );


  // Set current timestamp if not set
  if (!isset($params["Timestamp"])) {
      $params["Timestamp"] = gmdate('Y-m-d\TH:i:s\Z');
  }

  // Sort the parameters by key
  ksort($params);

  $pairs = array();

  foreach ($params as $key => $value) {
      array_push($pairs, rawurlencode($key)."=".rawurlencode($value));
  }

  // Generate the canonical query
  $canonical_query_string = join("&", $pairs);

  // Generate the string to be signed
  $string_to_sign = "GET\n".$endpoint."\n".$uri."\n".$canonical_query_string;

  // Generate the signature required by the Product Advertising API
  $signature = base64_encode(hash_hmac("sha256", $string_to_sign, $aws_secret_key, true));

  sleep(1);
  // Generate the signed URL
  $request_url = 'http://'.$endpoint.$uri.'?'.$canonical_query_string.'&Signature='.rawurlencode($signature);
  $xml=file_get_contents($request_url); // this WILL do an http request for you

  if(strpos($xml, "ReleaseDate>") !== FALSE){
    $date = substr($xml, strpos($xml, "ReleaseDate>") + 12,10);
    print_r("ISBN: " . $item . "    DATE: " . $date . "    ReleaseDate \r\n"); }
  elseif(strpos($xml, "PublicationDate>") !== FALSE){
    $date = substr($xml, strpos($xml, "PublicationDate>") + 16,10);
    print_r("ISBN: " . $item . "    DATE: " . $date . "    PublicationDate \r\n");
  } else { $date = "NAN"; }

  $arrayName[$item] = $date;
  $counter = $counter + 1;

  if($counter %250 == 0) {
    echo "TIME: " . TIME() . "\r\n";
    $fp = fopen('outputs/results__'. (string)$counter . "__" . (string)$item . '.csv', 'w');
    foreach ($arrayName as $fields) {
      $key = array_search($fields, $arrayName);
        //print_r($fields);
        //print_r($key);
        fputcsv($fp, explode(',',$key));
        fputcsv($fp, explode(',',$fields));
    }
    fclose($fp);
  }

}

$counter = $counter +1;
$fp = fopen('outputs_2/results__'. (string)$counter . "__" . (string)$item . '__FINAL.csv', 'w');
foreach ($arrayName as $fields) {
  $key = array_search($fields, $arrayName);
    //print_r($fields);
    //print_r($key);
    fputcsv($fp, explode(',',$key));
    fputcsv($fp, explode(',',$fields));
}
fclose($fp);

$time_post = microtime(true);
$exec_time = $time_post - $time_pre;
print_r("\n" . $exec_time);
?>
