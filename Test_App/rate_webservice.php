<?php
    
    ini_set('display_errors','On'); ini_set('error_reporting','E_ALL | E_STRICT'); error_reporting(E_ALL);
    
    function getStatusCodeMessage($status)
    {
        $codes = Array(
                       100 => 'Continue',
                       101 => 'Switching Protocols',
                       200 => 'OK',
                       201 => 'Created',
                       202 => 'Accepted',
                       203 => 'Non-Authoritative Information',
                       204 => 'No Content',
                       205 => 'Reset Content',
                       206 => 'Partial Content',
                       300 => 'Multiple Choices',
                       301 => 'Moved Permanently',
                       302 => 'Found',
                       303 => 'See Other',
                       304 => 'Not Modified',
                       305 => 'Use Proxy',
                       306 => '(Unused)',
                       307 => 'Temporary Redirect',
                       400 => 'Bad Request',
                       401 => 'Unauthorized',
                       402 => 'Payment Required',
                       403 => 'Forbidden',
                       404 => 'Not Found',
                       405 => 'Method Not Allowed',
                       406 => 'Not Acceptable',
                       407 => 'Proxy Authentication Required',
                       408 => 'Request Timeout',
                       409 => 'Conflict',
                       410 => 'Gone',
                       411 => 'Length Required',
                       412 => 'Precondition Failed',
                       413 => 'Request Entity Too Large',
                       414 => 'Request-URI Too Long',
                       415 => 'Unsupported Media Type',
                       416 => 'Requested Range Not Satisfiable',
                       417 => 'Expectation Failed',
                       500 => 'Internal Server Error',
                       501 => 'Not Implemented',
                       502 => 'Bad Gateway',
                       503 => 'Service Unavailable',
                       504 => 'Gateway Timeout',
                       505 => 'HTTP Version Not Supported'
                       );
        
        return (isset($codes[$status])) ? $codes[$status] : '';
    }
    
    function sendResponse($status = 200, $body = '', $content_type = 'text/html')
    {
        $status_header = 'HTTP/1.1 ' . $status . ' ' . getStatusCodeMessage($status);
        header($status_header);
        header('Content-type: ' . $content_type);
        echo $body;
    }
    
    class RateAPI {
        
        private $db;
        
        function __construct() {
            $this->db = new mysqli('127.6.132.2', 'adminKlqIG2c', '1qWwfds9kGTR', 'thephotoschoppe');
            $this->db->autocommit(FALSE);
        }
        
        function __destruct() {
            $this->db->close();
        }
        
        function getIndividualRatingByUserAndImageID() {
            
            $user_id = $_GET["user_id"];
            $image_id = $_GET["image_id"];
            
            $stmt = $this->db->prepare('SELECT rating FROM tbl_user_rating WHERE user_id=? AND image_id=?');
            $stmt->bind_param("ss", $user_id, $image_id);
            $stmt->execute();
            $stmt->bind_result($existing_rating);
            while ($stmt->fetch()) {
                break;
            }
            $stmt->close();
            
            if ($existing_rating <= 0) {
                sendResponse(400, 'NO_RATE');
                return false;
            }
            
            $result = array(
                            "existing_rating" => $existing_rating,
                            );
            
            sendResponse(200, json_encode($result));
            return true;
        }
        
        function getOverallRatingForImageId() {
            
            $image_id = $_GET["image_id"];
            
            $stmt = $this->db->prepare('SELECT avg(rating) as overall_rate from tbl_user_rating where image_id=?');
            $stmt->bind_param("s", $image_id);
            $stmt->execute();
            $stmt->bind_result($avg_rating);
            while ($stmt->fetch()) {
                break;
            }
            $stmt->close();
            
            if ($avg_rating <= 0) {
                sendResponse(400, 'NO_RATE');
                return false;
            }
            
            $result = array(
                            "avg_rating" => $avg_rating,
                            );
            
            sendResponse(200, json_encode($result));
            return true;
        }
        
        function updateIndividualRatingByUserAndImageId() {
            
            $user_id = $_GET["user_id"];
            $image_id = $_GET["image_id"];
            $rating = $_GET["rating"];
            
            $stmt = $this->db->prepare('SELECT rating FROM tbl_user_rating WHERE user_id=? AND image_id=?');
            $stmt->bind_param("ss", $user_id, $image_id);
            $stmt->execute();
            $stmt->bind_result($existing_rating);
            while ($stmt->fetch()) {
                break;
            }
            $stmt->close();
            
            
            if($existing_rating <= 0){
                $this->db->query("INSERT INTO tbl_user_rating (user_id, image_id, rating) VALUES ($user_id, $image_id, $rating)");
                $this->db->commit();
                
            }
            else{
                $this->db->query("UPDATE tbl_user_rating SET rating=$rating WHERE user_id=$user_id AND image_id=$image_id");
                $this->db->commit();
            }
            
            $result = array("STATUS" => 'RATING_UPDATED',);
            
            sendResponse(200, json_encode($result));
            return true;
        }
        
    }
    
    $api = new RateAPI;
    
    if (isset($_GET["flag"])){
        if($_GET["flag"] == 'GET_RATING'){
            if (isset($_GET["user_id"]) && isset($_GET["image_id"])) {
                $api->getIndividualRatingByUserAndImageID();
            }
        }
        else if($_GET["flag"] == 'UPDATE_RATING'){
            if (isset($_GET["user_id"]) && isset($_GET["image_id"]) && isset($_GET["rating"])) {
                $api->updateIndividualRatingByUserAndImageId();
            }
        }
        else if($_GET["flag"] == 'GET_AVG_RATING'){
            if (isset($_GET["image_id"])) {
                $api->getOverallRatingForImageId();
            }
        }
        else{
            sendResponse(400, 'INVALID_REQUEST');
            return false;
        }
    }
    else{
        sendResponse(400, 'INVALID_REQUEST');
        return false;
    }
    
    ?>