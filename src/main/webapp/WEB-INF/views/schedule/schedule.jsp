<%@page import="com.ace.member.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>schedule</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
#calendar {
   margin: 10px auto;

}

#month {
   margin: 0px auto;
}

#calendar td {
   border-top: 1px solid gray;
   width: 100px;
   height: 100px;
}

.sunday {
   color: red;
}

.monthday {
   
}

.tuesday {
   
}

.wednesday {
   
}

.thursday {
   
}

.friday {
   
}

.saturday {
   color: blue;
}

.tdList {
   width: 100px;
   height: 80px;
}

.weekName-div {
   text-align: center;
   width: 100px;
   display: inline;
   float: left;
}

select {
   border: none;
   outline: none;
}

.year-select {
   -webkit-appearance: none;
   -moz-appearance: none;
   appearance: none;
   background-color: transparent;
   border: none;
   outline: none;
   display: inline-block;
   padding: 5px 10px;
   border: 1px solid #ccc;
   border-radius: 5px;
   background-color: #fff;
   cursor: pointer;
}

.month-select {
   -webkit-appearance: none;
   -moz-appearance: none;
   appearance: none;
   background-color: transparent;
   border: none;
   outline: none;
   font-size: 35px;
   text-align: center;
   display: inline-block;
   padding: 10px 10px;
   border: 1px solid #ccc;
   border-radius: 5px;
   background-color: #fff;
   margin-left: 30px;
   margin-right: 30px;
   cursor: pointer;
   position: relative;
}

input[type="button"] {
   width: 35px;
   height: 50px;
   border: none;
   font-size: 35px;
   background-color: #ffffff;
}

#on_art {
   position: absolute;
   top: 0;
   left: 0;
   height: 140vh;
   width: 100%;
   background-color: rgba(0, 0, 0, 0.5);
   display: none;
   z-index: 900;
   align-items: center;
   justify-content: center;
}

#on_input {
   position: absolute;
   top: 0;
   left: 0;
   height: 140vh;
   width: 100%;
   background-color: rgba(0, 0, 0, 0.5);
   display: none;
   z-index: 999;
   align-items: center;
   justify-content: center;
}

#schedule_form {
   text-align: center;
   background-color: skyblue;
   width: 400px;
   height: 500px;
}
#input_form {
   text-align: center;
   background-color: skyblue;
   width: 400px;
   height: 510px;
}
#sdiv{
   clear:both;
   width:400px;
   height:425px;
   background: white;
   margin: 10px auto;
}
#goButton{
   margin-left:30px;
   padding-top: 1px;
   padding-left: 1px;
   width:20px;
   height:20px;
   background-color: silver;
}
#ico{
   font-size: 15px;
}
#closeButton{
   float: right;
   border:none;
   background: none;
}
ul{
   padding-left: 0px;
   list-style-type: none;
   
}

#comimg{
    width: 150px;
    height: 150px;
}

#left {
    width: 200px;
    height: 900px;
    float: left;
    border-right: 2px solid black;
    margin-left: 50px;
}

#right {
    width: 900px;
    height: 1500px;
    margin-left: 330px;
}

a{
	text-decoration: none;
}
</style>
<script src="js/httpRequest.js"></script>
<script>
   var now = new Date();
   var year = 0;
   var criyear = now.getFullYear();
   var month = 0;
   var days = ['sunday','monthday','tuesday','wednesday','thursday','friday','saturday'];
   var firstDay = 0;
   var count = 0;
   var lastDate = 0;
   var row = 0;
   var idx=0;
   var com_idx=0;
   var sort=0;
   var data=null;
   var nowDate=0;
   var nowDay=0;
   var refin=0;
   //페이지 실행될때
   function startPage(pidx,pcom_idx,psort){
      userInfo(pidx,pcom_idx,psort)
      callCal(0,0,1);
   }
   //유저 정보 기본세팅
   function userInfo(pidx,pcom_idx,psort){
      idx=pidx;
      com_idx=pcom_idx;
      sort=psort;
   }
   //달력 호출
   function callCal(pyear, pmonth, psort) {
      sort=psort;
      row = 0;
      if (pyear != 0 || pmonth != 0) {
         now = new Date(pyear, pmonth, 1);
      }
      getRow();
      getTop();
      selectList();
   }
   //유동적으로 변하는 달의 행을 구하는 거시기
   function getRow() {
      year = now.getFullYear();
      month = now.getMonth();
      lastDate = new Date(year, (month + 1), 0).getDate();
      firstDay = new Date(year, month, 1).getDay();

      count = firstDay;
      for (var i = 1; i <= lastDate; i++) {
         if (count == 6) {
            count = -1;
            row += 1;
         } else if (i == lastDate) {
            row += 1;
         }
         count += 1;
      }
   }
   //달력 만들어주는 함수
   function createCal() {
      count = 1;
      var tableNode = document.getElementById('calendar');
      tableNode.innerHTML = "";
      for (var j = 1; j <= row; j++) {
         var trNode = document.createElement('tr');
         for (var i = 0; i <= 6; i++) {
            if (count == 1 && firstDay != 0) {
               var voidTdNode = document.createElement('td');
               voidTdNode.setAttribute('colspan', firstDay);
               voidTdNode.setAttribute('class', 'voidTdNode');
               trNode.appendChild(voidTdNode);
               i = firstDay;
            }
            var tdNode = document.createElement('td');
            tdNode.setAttribute('onclick', 'showOnArt('+year+','+month +','+ count+','+i+')');
            var tdDivNode = document.createElement('div');
            tdDivNode.setAttribute('class', days[i]);
            var tdDateText = document.createTextNode(count);
            tdDivNode.appendChild(tdDateText);
            tdNode.appendChild(tdDivNode);       
            var tdListNode = document.createElement('div');           
            tdListNode.setAttribute('class','tdList');
            var ulListNode=document.createElement('ul');
            var lists=data.map[count.toString()];
            for(var z=0;z<lists.length;z++){
               if(z<=3){
                  var liListNode=document.createElement('li');
                  liListNode.setAttribute('style','font-size:12px; background-color: rgba(0, 100, 255, 0.2); border-radius: 5px;')
                  var liText=lists[z].title;
                  if(liText.length>=6){
                     liText=liText.substring(0,6);+'..'
                  }
                  liListNode.innerHTML=liText;
                  ulListNode.appendChild(liListNode);
               }
               if(z>3&&z==(lists.length-1)){
                  var liListNode=document.createElement('li');
                  liListNode.setAttribute('style','font-size:8px;');
                  var liText='..외'+(lists.length-4)+'개의 일정';
                  liListNode.innerHTML=liText;
                  ulListNode.appendChild(liListNode);
               }
            }
            tdListNode.appendChild(ulListNode);
            tdNode.appendChild(tdListNode);
            trNode.appendChild(tdNode);
            if (count == lastDate && i != 6) {
               var voidTdNode = document.createElement('td');
               voidTdNode.setAttribute('colspan', 6 - i);
               voidTdNode.setAttribute('class', 'voidTdNode');
               trNode.appendChild(voidTdNode);
               i = 7;
            }
            count += 1;
         }
         tableNode.appendChild(trNode);
      }
   }
   //고정되는 달력의 상단부분
   function getTop() {
      var hDiv = document.getElementById('month');
      hDiv.setAttribute('style', 'text-align:center;')
      getYear(hDiv);
      getMonth(hDiv);
   }
   //연도 동적으로 바꿀수 있게 하는 함수
   function getYear(hDiv) {
      var hyear = hDiv.firstChild;
      hyear.innerHTML = "";
      var hySelect = document.createElement('select');
      hySelect.setAttribute('class', 'year-select');

      for (var i = criyear - 20; i <= criyear + 20; i++) {
         var opNode = document.createElement('option');
         opNode.setAttribute('value', i);
         if (i == year) {
            opNode.setAttribute('selected', 'selected');
         }
         opNode.innerHTML = i;
         hySelect.appendChild(opNode);
      }
      hySelect.setAttribute('onchange', 'callCal(this.value,'+month+','+sort+')');
      hyear.appendChild(hySelect);
   }
   //월 동적으로 바꿀수 있게하는 함수
   function getMonth(hDiv) {
      var hmonth = hDiv.lastChild;
      hmonth.innerHTML = "";
      var hText = document.createElement('select');
      hText.setAttribute('class', 'month-select');
      for (var i = 0; i <= 11; i++) {
         var opNode = document.createElement('option');
         opNode.setAttribute('value', i);
         if (i == month) {
            opNode.setAttribute('selected', 'selected');
         }
         opNode.innerHTML = i + 1;
         hText.appendChild(opNode);
      }
      hText.setAttribute('onchange', 'callCal(' + year + ',this.value'+','+sort+')');

      var hlp = document.createElement('input');
      hlp.setAttribute('type', 'button');
      hlp.setAttribute('value', '<');
      hlp.setAttribute('onclick', 'callCal('+year+','+(month-1)+','+sort+')');
      var hrp = document.createElement('input');
      hrp.setAttribute('type', 'button');
      hrp.setAttribute('value', '>');
      hrp.setAttribute('onclick','callCal('+year+','+(month+1)+','+sort+')');
      hmonth.appendChild(hlp);
      hmonth.appendChild(hText);
      hmonth.appendChild(hrp);
      hDiv.appendChild(hmonth);
   }
   // 달력의 분류 바꿔주는 함수
   function changeSort(psort){
      callCal(year, month, psort);
   }
   // 일을 클릭했을때 일정 정보 영역 호출하는 함수
   function showOnArt(year,month,date,i) {
      nowDate=date;
      nowDay=i;
      var day=days[nowDay]
      var formNode=document.getElementById("schedule_form");
      formNode.innerHTML="";
      var hNode=document.createElement('h1');
      hNode.setAttribute('style','display: inline;');
      var dateNode=document.createTextNode(year+'.'+(month+1)+'.'+date+'.'+day);
      hNode.appendChild(dateNode);
      formNode.appendChild(hNode);
      var inserBt=document.createElement('button');
      inserBt.setAttribute('type','button');
      inserBt.innerHTML='<i id="ico" class="material-icons">edit</i>';
      inserBt.setAttribute('id','goButton');
      inserBt.setAttribute('onclick','showOnDiv('+year+','+month+','+date+','+null+')');
      formNode.appendChild(inserBt);
      var closeBt=document.createElement('button');
      closeBt.setAttribute('type','button');
      closeBt.setAttribute('onclick','hideOnArt()');
      closeBt.innerHTML='X';
      closeBt.setAttribute('id','closeButton');
      formNode.appendChild(closeBt);
      //listNode
      var sdiv=document.createElement('div');
      sdiv.setAttribute('id','sdiv');
      var lists=data.map[date.toString()];
      if(lists!=null||lists.length!=0){
         for(var z=0;z<lists.length;z++){
            var sInf=document.createElement('div');
            sInf.setAttribute('style','text-align:left; padding:10px 10px;');
            sInf.setAttribute('id','sdivChildNode'+z);
            var timeSite=document.createElement('span');
            timeSite.setAttribute('style','display: inline-block; width:50px; font-size:12px; margin-right: 30px;');
            var smnatime=lists[z].stime;
            var smnatimeText='am:'+smnatime;
            if(smnatime>12){
               smnatimeText='pm:'+(smnatime-12);
            }
            var emnatime=lists[z].etime;
            var emnatimeText='am:'+emnatime;
            if(emnatime>12){
               emnatimeText='pm:'+(emnatime-12);
            }
            var timeText=smnatimeText+'~'+emnatimeText;
            timeSite.innerHTML=timeText;
            var listData=document.createElement('span');
            listData.setAttribute('style','display: inline-block; width:230px; background: rgba(0, 128, 0, 0.3);'
            +'padding-left:10px; border-radius: 7px;');
            listData.setAttribute('onclick','showOnDiv('+year+','+month+','+date+','+z+')');
            listData.innerHTML=lists[z].title;
            var delBt=document.createElement('button');
            delBt.setAttribute('type','button');
            delBt.innerHTML='<i id="ico" class="material-icons">delete</i>';
            delBt.setAttribute('id','goButton');
            delBt.setAttribute('onclick','delList('+lists[z].schedule_idx+','+z+')');
            sInf.appendChild(timeSite);
            sInf.appendChild(listData);
            sInf.appendChild(delBt);
            sdiv.appendChild(sInf);
         }
      }
      
      formNode.appendChild(sdiv);
      document.getElementById("on_art").style.display = "flex";
   }
   // 일정 정보 영역 다시 숨겨주는 함수
   function hideOnArt() {
      selectList();
      document.getElementById("on_art").style.display = "none";
   }
   // 일정 등록을 위한 폼을 호출하는 함수
   function showOnDiv(year, month, date ,z) {
      var formNode=document.getElementById("input_form");
      formNode.innerHTML="";
      var hNode=document.createElement('h1');
      hNode.setAttribute('style','display: inline;');
      if(z==null){
         var dateNode=document.createTextNode('일정등록');
         hNode.appendChild(dateNode);
      }else{
         var dateNode=document.createTextNode('일정수정');
         hNode.appendChild(dateNode);
      }
      hNode.appendChild(dateNode);
      formNode.appendChild(hNode);
      var closeBt=document.createElement('button');
      closeBt.setAttribute('type','button');
      closeBt.setAttribute('onclick','hideOnDiv()');
      closeBt.innerHTML='X';
      closeBt.setAttribute('id','closeButton');
      formNode.appendChild(closeBt);
      var list=null;
      if(z!=null){
         var lists=data.map[date.toString()];
         list=lists[z];
      }
      //input site
      var brNode=document.createElement('br')
      var hrNode1=document.createElement('hr')
      var hrNode2=document.createElement('hr')
      var sdiv=document.createElement('div');
      sdiv.setAttribute('id','sdiv');
      //title site
      var titleText=document.createTextNode('요약:');
      var titleNode=document.createElement('input');
      titleNode.setAttribute('type','text');
      titleNode.setAttribute('id','title');
      if(list!=null){
         titleNode.setAttribute('value',list.title);
      }
      sdiv.appendChild(titleText);
      sdiv.appendChild(titleNode);
      sdiv.appendChild(hrNode1);
      //time site
      var smnaSelectNode=document.createElement('select');
      smnaSelectNode.setAttribute('id','smna');
      for(var i=1;i<=2;i++){
         var smnaOptionNode=document.createElement('option');
         smnaOptionNode.setAttribute('value',i);
         smnaOptionNode.innerHTML=i==1?'am':'pm';
         if(list!=null){
            var checked=list.stime>12?2:1;
            if(checked==i){
               smnaOptionNode.setAttribute('selected','selected');
            }
         }
         smnaSelectNode.appendChild(smnaOptionNode);
      }
      var stimeSelectNode=document.createElement('select');
      stimeSelectNode.setAttribute('id','stime');
      for(var i=1;i<=12;i++){
         var stimeOptionNode=document.createElement('option');
         stimeOptionNode.setAttribute('value',i);
         stimeOptionNode.innerHTML=i;
         if(list!=null){
            var stime=list.stime>12?(list.stime/2):list.stime;
            if(stime==i){
               stimeOptionNode.setAttribute('selected','selected');
            }
         }
         stimeSelectNode.appendChild(stimeOptionNode);
      }
      var emnaSelectNode=document.createElement('select');
      emnaSelectNode.setAttribute('id','emna');
      for(var i=1;i<=2;i++){
         var emnaOptionNode=document.createElement('option');
         emnaOptionNode.setAttribute('value',i);
         emnaOptionNode.innerHTML=i==1?'am':'pm';
         if(list!=null){
            var checked=list.etime<=12?1:2;
            if(checked==i){
               emnaOptionNode.setAttribute('selected','selected');
            }
         }
         emnaSelectNode.appendChild(emnaOptionNode);
      }
      var etimeSelectNode=document.createElement('select');
      etimeSelectNode.setAttribute('id','etime');
      for(var i=1;i<=12;i++){
         var etimeOptionNode=document.createElement('option');
         etimeOptionNode.setAttribute('value',i);
         etimeOptionNode.innerHTML=i;
         if(list!=null){
            var etime=list.etime>12?(list.etime/2):list.etime;
            if(etime==i){
               etimeOptionNode.setAttribute('selected','selected');
            }
         }
         etimeSelectNode.appendChild(etimeOptionNode);
      }
      var waveNode=document.createTextNode('~');
      sdiv.appendChild(smnaSelectNode);
      sdiv.appendChild(stimeSelectNode);
      sdiv.appendChild(waveNode);
      sdiv.appendChild(emnaSelectNode);
      sdiv.appendChild(etimeSelectNode);
      sdiv.appendChild(hrNode2);
      //textarea site
      var contentText=document.createTextNode('상세설명(공백 포함 500자 미만)');
      var contentNode=document.createElement('textarea');
      contentNode.setAttribute('id','content');
      contentNode.setAttribute('rows','18');
      contentNode.setAttribute('cols','30');
      if(list!=null){
         contentNode.value=list.content;
      }
      sdiv.appendChild(contentText);
      sdiv.appendChild(brNode);
      sdiv.appendChild(contentNode);
      formNode.appendChild(sdiv);
      //addSchedule site
      var submitNode=document.createElement('button');
      submitNode.setAttribute('id','submitBt');
      if(list==null){
         submitNode.setAttribute('onclick','addSchedule(new Date('+year+','+month+','+date+'))');
         submitNode.innerHTML='등록';
      }else{
         submitNode.setAttribute('onclick','upSchedule('+list.schedule_idx+')');
         submitNode.innerHTML='수정';
      }
      formNode.appendChild(submitNode);
      document.getElementById("on_input").style.display = "flex";
   }
   // 일정등록 폼 다시 숨겨주는 함수
   function hideOnDiv() {
      refin=0;
      document.getElementById("on_input").style.display = "none";
   }
   // 일정등록을 수행하는 함수
   function addSchedule(nowDate){
      var title=document.getElementById('title');
      var content=document.getElementById('content');
      var stime=document.getElementById('stime');
      var etime=document.getElementById('etime');
      var smna=document.getElementById('smna');
      var emna=document.getElementById('emna');
      
      var nyear = nowDate.getFullYear();
      var nmonth = nowDate.getMonth()+1;
      var ndate = nowDate.getDate();
      var sdate='';
      sdate = nyear+'-'+nmonth+'-'+ndate;
      
      var param='idx='+idx+'&com_idx='+com_idx+'&sort='+sort+'&title='+title.value+
      '&content='+content.value+'&sdate='+sdate+'&stime='+stime.value+'&etime='+etime.value+
      '&smna='+smna.value+'&emna='+emna.value;
      sendRequest('addSchedule.do',param,showResult,'POST');
   }
   function upSchedule(schedule_idx){
      var title=document.getElementById('title').value;
      var content=document.getElementById('content').value;
      var stime=document.getElementById('stime').value;
      var etime=document.getElementById('etime').value;
      var smna=document.getElementById('smna').value;
      var emna=document.getElementById('emna').value;
      var param='schedule_idx='+schedule_idx+'&title='+title+'&content='+content+'&stime='+stime+'&etime='+etime+
      '&smna='+smna+'&emna='+emna;
      sendRequest('upSchedule.do',param,upResult,'POST');
   }
   //일정삭제 수행하는 함수
   function delList(schedule_idx,z){
      var param="schedule_idx="+schedule_idx;
      var sdivNode=document.getElementById('sdiv');
      var sdivChildNode=document.getElementById('sdivChildNode'+z);
      sdivNode.removeChild(sdivChildNode);
      sendRequest('delSchedule.do',param,delResult,'POST');
   }
   //현재 달력의 등록글들 select하기
   function selectList(){
      var param="year="+year+"&month="+(month+1)+"&sort="+sort+"&idx="+idx+"&lastDate="+lastDate;
      sendRequest('selectSchedule.do',param,listResult,'POST');
   }
   //일정 등록 결과를 보여주는 함수
   function showResult(){
      if(XHR.readyState==4){
         if(XHR.status==200){
            var data1=XHR.responseText;
            data1=JSON.parse(data1);
            var msg=data1.msg;
            alert(msg);
            if(msg=='등록성공'){
               refin=1;
               selectList();
            }
         }
      }
   }
   //일정 삭제 결과를 보여주는 함수
   function delResult(){
      if(XHR.readyState==4){
         if(XHR.status==200){
            var data1=XHR.responseText;
            data1=JSON.parse(data1);
            var msg=data1.msg;
            alert(msg);
         }
      }
   }
   //수정 결과 보여주는 함수
   function upResult(){
      if(XHR.readyState==4){
         if(XHR.status==200){
            var data1=XHR.responseText;
            data1=JSON.parse(data1);
            var msg=data1.msg;
            alert(msg);
            if(msg=='수정완료'){
               refin=1;
               selectList();
            }
         }
      }
   }
   function aaaaa(){
      hideOnDiv();
      showOnArt(year,month,nowDate,nowDay);
   }
   //현재 달력의 등록글들 json으로 불러오기
   function listResult(){
      if(XHR.readyState==4){
         if(XHR.status==200){
            data=XHR.responseText;
            data=JSON.parse(data);
            createCal();
            if(refin==1){
               aaaaa();
            }
         }
      }
   }
   
</script>
</head>
<body onload="javascript:startPage(${sessionScope.dto.idx },${sessionScope.dto.com_idx },1)">
<div>
<div id="left">

<div class="mt-3">
				<c:if test="${cdto.com_img ==null }">
					<a href="goMain.do"><img id="comimg" src="img/noImage/noImage.jpg"></a>
				</c:if>
				<c:if test="${cdto.com_img !=null }">
					<a href="goMain.do"><img id="comimg"
						src="img/${cdto.com_name}/${cdto.com_img}"></a>
				</c:if>
			</div>
<div class="mt-3">
<a href="company_news_List.do?com_idx=${dto.getCom_idx()}">회사소식</a> <br> 
<a href="company_event_List.do?com_idx=${dto.getCom_idx()}">경조사</a> <br> 
<a href="memberMailList.do?com_idx=${dto.getCom_idx()}">메일</a> <br>
<a href="approval.do?idx=${dto.getIdx()}">결재문서</a> <br>
<a href="schedule.do">스케줄</a> <br>
<a href="insa.do">인사관리</a> <br>
</div>

</div>

<div id="right">
   <div>
      <div id="under_art">

         <h1>캘린더</h1>
         <div id="selectSort">
            <select onchange="changeSort(this.value)">
               <option value="1">개인</option>
               <option value="2">부서</option>
               <option value="3">회사</option>
            </select>
         </div>
         <div id="month"><div></div><h1></h1></div>
         <div style="margin: 0px auto; width: 700px;">
            <div class="weekName-div">
               <label class="sunday">sun</label>
            </div>
            <div class="weekName-div">
               <label class="monthday">mon</label>
            </div>
            <div class="weekName-div">
               <label class="tuesday">tue</label>
            </div>
            <div class="weekName-div">
               <label class="wednesday">wed</label>
            </div>
            <div class="weekName-div">
               <label class="thursday">thu</label>
            </div>
            <div class="weekName-div">
               <label class="friday">fri</label>
            </div>
            <div class="weekName-div">
               <label class="saturday">sat</label>
            </div>
         </div>

         <table id="calendar" cellspacing="0">
         </table>

      </div>
      <div id="on_art">
         <div id="schedule_form"></div>
      </div>
      <div id="on_input">
         <div id="input_form"></div>
      </div>
   </div>
   </div>
</div>   
</body>
</html>