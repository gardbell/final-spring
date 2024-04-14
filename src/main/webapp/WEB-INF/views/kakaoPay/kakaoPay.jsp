<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
    article{
       margin: 10px auto;
       text-align: center;
       width: 300px;
    }
    #selectPnum{
       float: right;
    }
    #description{
       clear: both;
       background-color: lightgray;
       width: 300px;
       height: 500px;
    }
    #empText{
       color: blue;
    }
    #receipt{
       margin: 0px auto;
       width:250px;
       height: 200px;
       background-color: white;
    }
    #submitBt{
       margin: 0px auto;
       display: block;
       clear: both;
    }
</style>
   <script src="js/httpRequest.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
       var totalPrice=0;
        var IMP = window.IMP; 
        IMP.init("imp22363011"); 
        var today = new Date();   
        var hours = today.getHours();
        var minutes = today.getMinutes();
        var seconds = today.getSeconds();
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        var com_idx=0;
        function requestPay(email,name,tel,addr,pcom_idx) {
           com_idx=pcom_idx;
            IMP.request_pay({
                pg : 'kakaopay',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : '그룹웨어 라이센스',
                amount : totalPrice,
                buyer_email : email,
                buyer_name : name,
                buyer_tel : tel,
                buyer_addr : addr,
                buyer_postcode : '123-456'
            }, function (rsp) {
                if (rsp.success) {
                    console.log(rsp);
                    var price_sort=document.getElementById('price').value;
                    var usernum=document.getElementById('pnum').value;
                    location.href='goPay.do?com_idx='+com_idx+'&price_sort='+price_sort+
                          '&usernum='+usernum;
                } else {
                    console.log(rsp);
                }
            });
        }
        function createList(){
           var belistText=document.getElementById('listText');
           if(belistText!=null){
              belistText.parentNode.removeChild(belistText);
           }
           var parNode=document.getElementById('selectPrice');
           var listNode=document.getElementById('receipt');
           var pnum=parseInt(document.getElementById('pnum').value);
           var priceSelectNode=document.getElementById('price');
           var priceList=priceSelectNode.getElementsByTagName('option');;
           var priceText=priceList[parseInt(document.getElementById('price').value)].value;
           var price=parseInt(priceList[parseInt(document.getElementById('price').value)-1].textContent);
           totalPrice=pnum*price;
           var totalPrice_s=totalPrice.toString();
           var totalPrice_ss='';
           var count2=1;
           for(var i=totalPrice_s.length;i>0;i--){
              if(count2%3==1&&count2!=1){
                 totalPrice_ss+=',';
              }
              totalPrice_ss+=totalPrice_s[i-1];
              count2++
           }
           
           var sprice=(totalPrice*12);
           var sprice_s=sprice.toString();
           var yearPrice='';
           var count=1;
           for(var i=sprice_s.length;i>0;i--){
              if(count%3==1&&count!=1){
                 yearPrice+=',';
              }
              yearPrice+=sprice_s[i-1];
              count++
           }
           var listText=document.createElement('span');
           listText.innerHTML=totalPrice_ss.split('').reverse().join('')+'원 /월 / '+pnum+'인 (1년:'+yearPrice.split('').reverse().join('')+'원)';
           listText.setAttribute('id','listText');
           parNode.insertBefore(listText, listNode);
           var check='${requestScope.check}';
           if(check==1){
              var pnumNode=document.getElementById('pnum');
              pnumNode.setAttribute('disabled','disabled');
              var priceNode=document.getElementById('price');
              priceNode.setAttribute('disabled','disabled');
              var btNode=document.getElementById('submitBt');
              btNode.innerHTML="사용중단";
              btNode.removeAttribute('onclick');
              btNode.setAttribute('onclick','stopLicense()');
           }
        }
        function stopLicense(){
           var param="com_idx="+'${dto.com_idx}';
           sendRequest('stopLicense.do',param,stopResult,'POST');
        }
        function stopResult(){
           if(XHR.readyState==4){
                if(XHR.status==200){
                   var data = XHR.responseText;
                    data = JSON.parse(data);
                    var msg = data.msg;
                    if(msg=='중단 성공 서비스 이용기간은 다음달 결제일 까지입니다.'){
                        window.alert(msg);
                        location.href="goMain.do";
                    }else {
                       window.alert(msg);
                    }
                } else {
                    window.alert("서버 오류가 발생했습니다.");
                }
            }
        }
    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body onload="createList()">
<section>
   <article>
   <a href="goMain.do">홈으로</a>
      <h1>구매 상품</h1>
      <div id="selectPnum">
         <label>이용자수:</label>
         <select id="pnum" onchange="createList()">
            <option value="5">5</option>
            <option value="10">10</option>
            <option value="15">15</option>
            <option value="20">20</option>
            <option value="25">25</option>
            <option value="30">30</option>
            <option value="35">35</option>
            <option value="40">40</option>
            <option value="45">45</option>
            <option value="50">50</option>
         </select>
      </div>
      <div id="description">
         <h4>그룹웨어</h4>
         <label id="empText">전자메일, 전자결제, 근무 관리</label>까지 <br>
         가능한 합리적인 비용의 그룹웨어<br><br>
         <div id="selectPrice">
            <select id="price" onchange="createList()">
               <c:forEach var="dto" items="${list}">
                  <option value="${dto.price_sort}">${dto.price}</option>
               </c:forEach>
            </select>
            <label>원/월</label> <label>(1인기준)</label><br>
            <div id="receipt">
               <div style="float:left;">
                  <ul>
                     <li>사용자계정</li>
                     <li>사내메일</li>
                     <li>스케줄러</li>
                     <li>회사소식</li>
                     <li>인사관리</li>
                  </ul>
               </div>
               <div style="float:right;width:130px;">
                  <ul style="list-style-type: none;padding-left:0px;">
                     <li>25개</li>
                     <li>무제한</li>
                     <li>제공</li>
                     <li>제공</li>
                     <li>급여/근태관리</li>
                  </ul>
               </div>
               <button id="submitBt" onclick="requestPay('${dto.email}','${dto.name}','${dto.tel}','${dto.addr}','${dto.com_idx}')">결제하기</button>
            </div>
         </div>
      </div>
   </article>
</section>
</body>
</html>