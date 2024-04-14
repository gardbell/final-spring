var XHR=null;

function getXHR(){
	if(window.ActiveXObject){
		return new ActiveXObject('Msxml2.XMLHTTP');
	}
	else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else{
		return null;
	}
}

function sendRequest(url, param, callback, method){
	XHR = getXHR();
	
	var newMethod=method?method:'GET';
	if(newMethod!='GET' && newMethod!='POST'){
		newMethod = 'GET';
	}
	
	var newUrl=url;
	var newParam = (param==null||param=='')?null:param;
	if(newMethod=='GET'&newParam!=null){
		var newUrl = newUrl+'?'+newParam;
	}
	
	XHR.onreadystatechange=callback;
	XHR.open(newMethod,newUrl,true);
	XHR.setRequestHeader('content-type','application/x-www-form-urlencoded');
	XHR.send(newMethod=='POST'?newParam:null);

}