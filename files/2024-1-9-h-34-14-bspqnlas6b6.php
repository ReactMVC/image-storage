<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST");
header("Access-Control-Allow-Headers: Content-Type");

class GitHub
{
  // Private properties to store the repository owner, repository name, and access token
  private $repo_owner;
  private $repo_name;
  private $access_token;

  // Constructor that takes the repository owner, repository name, and access token as arguments
  public function __construct($repo_owner, $repo_name, $access_token)
  {
    $this->repo_owner = $repo_owner;
    $this->repo_name = $repo_name;
    $this->access_token = $access_token;
  }

  // Method to post a file to the GitHub repository
  public function post($file_path, $file_name)
  {
    // Construct the URL to the API endpoint for creating a new file in the /images folder
    $url = "https://api.github.com/repos/{$this->repo_owner}/{$this->repo_name}/contents/images/{$file_name}";

    // Define the data to be sent in the request body
    $data = array(
      "message" => "Add new file by AI-API",
      "content" => base64_encode(file_get_contents($file_path)),
      "branch" => "main"
    );

    // Define the headers to be sent in the request
    $headers = array(
      "Content-Type: application/json",
      "Authorization: Bearer {$this->access_token}",
      "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/113.0"
    );

    // Initialize a new cURL session
    $ch = curl_init();

    // Set the cURL options
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

    // Execute the cURL request and store the result
    $result = curl_exec($ch);

    // Close the cURL session
    curl_close($ch);

    // Return the result
    return $result;
  }
}

if (!isset($_GET['text'])) {
  http_response_code(400);
  header('Content-type: application/json; charset=utf-8');
  echo json_encode(array('ok' => false, 'code' => 400, 'message' => 'error: please enter text parametr'), JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
} else {
  $api = json_decode(file_get_contents("https://haji-api.ir/prompts?text=" . urlencode($_GET['text'])));

  if ($api && property_exists($api, 'result')) {
    $images = array();
    foreach ($api->result as $imageData) {
      // Encode the image data as base64 and generate a unique file name
    /*  $base64 = base64_encode(base64_decode($imageData)); // strip off data URI header and decode
      $file_name = date("Y-m-d-H-i-s") . '-' . uniqid() . '.png';

      // Create a new instance of the GitHub class with the repository owner, repository name, and access token
      $uploader = new GitHub("mohamadr1386", "Img", "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");

      // Construct the path to the temporary file
      $file_path = sys_get_temp_dir() . '/' . $file_name;

      // Write the base64-encoded image data to the temporary file
      file_put_contents($file_path, base64_decode($base64));

      // Call the post method of the GitHub class to upload the file to the repository
      $result = $uploader->post($file_path, $file_name);

      // Get the URL of the uploaded image from the GitHub response
      $url = json_decode($result)->content->download_url;
*/
      // Add the image URL to the array
      $images[] = array('url' => $imageData);
    }
    header('Content-type: application/json; charset=utf-8');
    echo json_encode(array('ok' => true, 'code' => 200, 'images' => $images), JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
  } else {
    header('Content-type: application/json; charset=utf-8');
    http_response_code(500);
    echo json_encode(array('ok' => false, 'code' => 500, 'message' => 'Error retrieving images from API'), JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
  }
}

?>