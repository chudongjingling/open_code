<?php
	$url = "https://storeauth.touchsprite.net/api/openapi";
	//$params = '{"action":"getAuth","key":"1m9KBrtFaGWY0eT2A1TGoY8KccjHTeYhxaVYbf858DZIRhSIW6LMVTqTiAoaOLV1","devices":["5de22bc756e541594b98396d6058a2a6"],"valid":3600,"time":'.time().'}';
	//echo ($params."\n");
	//echo ("\n");
	
	//function vpost($ch,$data){
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_TIMEOUT, 15);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 0);    // 要求结果为字符串且输出到屏幕上
		curl_setopt($ch, CURLOPT_HEADER, 0); // 不要http header 加快效率
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);    // https请求 不验证证书和hosts
	    curl_setopt($ch, CURLOPT_POSTFIELDS, file_get_contents("php://input"));
	    //curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
		$output = curl_exec($ch);
		curl_close($ch);
		//var_dump($output);
		//echo ("\naaaa".$output[2])
?>
