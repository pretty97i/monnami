
function chkRegPattern(pType, strInput) {//패턴 검증 정규식
    var regPattern;
    var arrResult;
    if (pType != undefined && strInput != undefined) {
        switch (pType) {
            case 'num': regPattern = /^[0-9]+$/; break; //숫자만 입력
            case 'tel': regPattern = /^\d{3}-\d{3,4}-\d{4}$/; break; //전화번호 입력
            case 'code': regPattern = /^[a-zA-Z0-9]{1,20}$/; break; //쿠폰번호 (영문 숫자만)
            case 'han': regPattern = /^[가-힣]+[가-힣]$/; break;
            case 'eng': regPattern = /^[a-zA-Z]+[a-zA-Z]$/; break;
            case 'ju1': regPattern = /^([\d]{2})(0[1-9]{1}|1[0-2]{1})(0[1-9]{1}|[1-2][\d]{1}|3[0-1]{1})$/; break;
            case 'ju2': regPattern = /^([1-8]{1})([\d]{6})$/; break;
            case 'id': regPattern = /^([a-zA-Z]{1})([\w-]{5,14})/; break;
            case 'pwd': regPattern = /^[\w]{6,15}/; break;
            case 'ans': regPattern = /^[가-힣\w\s-]{2,20}/; break;
            case 'mail1': regPattern = /^[a-z0-9_+.-]+/; break;
            case 'mail2': regPattern = /^[\w.-]+\.[a-zA-Z]{2,5}/; break;
            case 'mail': regPattern = /^[\w.-]+@[\w.-]+.[a-z]{2,5}/; break; //이메일 입력
            case 'con1': regPattern = /^[0]{1}[1-7]{1}[\d]{0,1}/; break;
            case 'con2': regPattern = /^[1-9]{1}[\d]{2,3}/; break;
            case 'con3': regPattern = /^[\d]{4}/; break;
            default: return false; break;
        }
        result = regPattern.test(strInput);
        return result;
        //result = strInput.match(regPattern);
        /*result = regPattern.exec(strInput);
        if ( result.split(",")(0) == strInput){return true;
        }else{return false;}*/
    } else {
        return false;
    }
}


function CheckPass(str,mode,min,max){//패스워드 검증 정규식
	
	var eng = str.search(/[a-z]/ig);
	var num = str.search(/[0-9]/g);
	var spe = str.search(/[`~!@@#$%^&*|₩₩₩"₩'";:₩/?]/gi);
	var tel = str.search(/[-|₩₩₩"₩";:₩/?]/gi);
	if(mode==1){//영문
		if(str.length >= min && str.length <= max && eng > -1){
			return 1;
		}
	}else if(mode==2){//영문 and 숫자
		if(str.length >= min && str.length <= max && eng > -1 && num > -1 ){
			return 1;
		}
	}else if(mode==3){//영문 or 숫자
		if(str.length >= min && str.length <= max && (eng > -1 || num > -1 ) && spe == -1){
			return 1;
		}
	}else if(mode=="tel"){//전화번호
		alert(spe)
		if(str.length >= min && str.length <= max && ( (tel > -1 || num > -1) && eng == -1 && spe == -1)){
			return 1;
		}
	}else{//영문 and 숫자 and 특수문자
		if(str.length > min && str.length < max && eng > -1 && num > -1 && spe > -1 ){
			return 1;
		}
	}
}

var checkPasswordValidate = function (val) {//연속된 숫자 금지
    return validatePassword(val, {
        length: [6, Infinity],
        lower: 0,
        upper: 0,
        numeric: 0,
        special: 0,
        badWords: ["password"],
        badSequenceLength: 4
    });
};

// a 태그에서 onclick 이벤트를 사용하지 않기 위해
function win_open(url, name, option)
{
	var popup = window.open(url, name, option);
	popup.focus();
}



//링크
function move_location(on){
	location=on;
}

//메일변경
function mail_change(on){
	if (document.all[on+"_email3"].value=="-"){
		document.all[on+"_email2"].value="";
		document.all[on+"_email2"].readOnly=false;
		document.all[on+"_email2"].focus();
	}else{
		document.all[on+"_email2"].value=document.all[on+"_email3"].value;
		document.all[on+"_email2"].readOnly=true;
	}
}

//기본 플레쉬 열때
function script_flash2(flash_root,w,h){
	flash_str=" <object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='"+w+"' height='"+h+"'> ";
	flash_str=flash_str+" <param name='movie' value='"+flash_root+"'> ";
	flash_str=flash_str+" <param name='quality' value='high'> ";
	flash_str=flash_str+" <param name='wmode' value='transparent' /> ";
	flash_str=flash_str+" <embed src='"+flash_root+"' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='"+w+"' height='"+h+"'></embed> ";
	flash_str=flash_str+" </object> ";

	document.write(flash_str);
}

//기본 플레쉬(플래시바스) 열때
function script_flash3(flash_root,w,h,xmlurl){
	flash_str=" <object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='"+w+"' height='"+h+"'> ";
	flash_str=flash_str+" <param name='movie' value='"+flash_root+"'> ";
	flash_str=flash_str+" <param name='quality' value='high'> ";
	flash_str=flash_str+" <param name='wmode' value='transparent' /> ";
	flash_str=flash_str+" <param name='flashvars' value='"+xmlurl+"' /> ";
	flash_str=flash_str+" <embed src='"+flash_root+"' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='"+w+"' height='"+h+"'></embed> ";
	flash_str=flash_str+" </object> ";

	document.write(flash_str);
}

//플레쉬 위치지정해서 열때
function script_flash(flash_root,w,h,left,top){
	flash_str=" <object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='"+w+"' height='"+h+"' style='position:absolute; left:"+left+"px; top:"+top+"px;'> ";
	flash_str=flash_str+" <param name='movie' value='"+flash_root+"'> ";
	flash_str=flash_str+" <param name='quality' value='high'> ";
	flash_str=flash_str+" <param name='wmode' value='transparent' /> ";
	flash_str=flash_str+" <embed src='"+flash_root+"' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='"+w+"' height='"+h+"'></embed> ";
	flash_str=flash_str+" </object> ";

	document.write(flash_str);
}

//입력값 길이 검사
function check_value(on,str,n) {
	str_value=on.value;
	str_value=str_value.replace(/ /g,"");
	str_value=str_value.replace(/\r\n/g,"");

	if (str_value.length==0) {
		alert(str + " 입력하세요.");
		on.value="";
		on.focus();
		return false;
	} else if (str_value.length<n) {
		alert(str + " " + n + "글자 이상 입력하세요.");
		on.focus();
		return false;
	}
}

//날짜 형식 검사 : 2006-07-08
function check_date(date_year,date_month,date_day) {
	if (
			((date_month=="02")&&(date_day>28))
			||((date_month=="04")&&(date_day>30)) || ((date_month=="06")&&(date_day>30))
			||((date_month=="09")&&(date_day>30)) || ((date_month=="11")&&(date_day>30))
		) {
		alert("잘못된 날짜입니다. 다시 선택하세요.");
		return false;
	}
}



//이메일 검사
function verify_email(on) {
	var reg = /^[A-Za-z0-9_\-]+([.][A-Za-z0-9_\-]+)*[@][A-Za-z0-9_\-]+([.][A-Za-z0-9_\-]+)+$/;
	
	if (reg.test(on)==false) {
		alert("잘못된 이메일 주소입니다. \n다시 작성하세요.");
		return false;
	}
}

//영문,숫자만 쓰기 경고~!
function check()
{
 var form = document.form1;
 var str = form.m_id.value;
 for(var i=0; i<str.length; i++)
 {
  if(((str.charCodeAt(i) >= 48 && str.charCodeAt(i) <=57) || (str.charCodeAt(i) >=65 && str.charCodeAt(i) <= 90) || (str.charCodeAt(i) >= 97 && str.charCodeAt(i) <= 122)))
  {

  }
  else {   alert("영문이나 숫자만 쓸수 있습니다.");
   form.m_id.value = "";
   return false;} // 처리
 }
}

//한글,영문만 쓰기 경고~!
function check2()
{
 var form = document.form1;
 var str = form.m_nick.value;
 for(var i=0; i<str.length; i++)
 {
  if(((str.charCodeAt(i)<65)||((str.charCodeAt(i)<=127)&&
	(str.charCodeAt(i)>122)))&&((str.charCodeAt(i))<48||(str.charCodeAt(i))>57))
  {
 alert("한글이나 영어만 쓸수 있습니다.");
   form.m_nick.value = "";
   return false;
  }
  else {   } // 처리
 }
}



//이미지 파일 검사
function check_image(on) {
	extension=on.substr(on.length-3,3);
	extension=extension.toLowerCase();

	if (((extension=="jpg")||(extension=="gif")||(extension=="png")||(extension=="tif")||(extension=="swf"))==false) {
		alert("JPG / GIF / SWF / PNG / TIF 이미지를 선택하세요.");
		return false;
	}
}



//주민등록번호 검사
function verify_ssn(on1,on2) {
	a=on1.value.charAt(0); b=on1.value.charAt(1); c=on1.value.charAt(2);
	d=on1.value.charAt(3); e=on1.value.charAt(4); f=on1.value.charAt(5);

	g=on2.value.charAt(0); h=on2.value.charAt(1); i=on2.value.charAt(2);
	j=on2.value.charAt(3); k=on2.value.charAt(4); l=on2.value.charAt(5);
	m=on2.value.charAt(6);

	q=c+d;
	r=0;
	num=0;
	if ((a+b)<20) {
		t=4;
	} else {
		t=2;
	}
	if ((q>12)||(q<1)) {
		num=1;
	} else if ((q==4)||(q==6)||(q==9)||(q==11)) {
		r=30;
	} else if (q==2) {
		r=29;
	} else {
		r=31;
	}
	if (((e+f)>r)||((e+f)<1)) {
		num=1;
	} else if (g>t) {
		num=1;
	} else {
		n=a*2 + b*3 + c*4 + d*5 + e*6 + f*7 + g*8 + h*9 + i*2 + j*3 + k*4 + l*5;
		p=11-(n%11);
		if (p==10) {
			p=0;
		} else if (p==11) {
			p=1;
		}
		if (p!=m) {
			num=1;			
		}
	}
	if (num==1) {
		alert("잘못된 주민등록번호입니다. \n다시 작성하세요.")
		on2.value=""
		on2.focus();
		return false;
	}	
}


function email_chk(email){
  if (email == "")
  {
	 $("#email2").val('')
  }else{
	 $("#email2").val(email)
  }
  $("#email2").focus();
}

function email_chk2(email,email2){
  if (email == "")
  {
	 $("."+email2+"").val('')
  }else{
	 $("."+email2+"").val(email)
  }
}

function login_chk(form){
  if ($("#m_id").val()==""){
      alert("이메일 주소를 입력해 주세요.");
	  $("#m_id").focus();
	  return false;
  }

  if ($("#m_pwd").val()==""){
      alert("비밀번호를 입력해 주세요.");
	  $("#m_pwd").focus();
	  return false;
  }
}


function find_id(form){
  if ($("#m_name").val()==""){
      alert("이름을 입력해 주세요.");
	  $("#m_name").focus();
	  return false;
  }

  if ($("#m_mobile").val()==""){
      alert("연락처를 입력해 주세요.");
	  $("#m_mobile").focus();
	  return false;
  }
}

function find_pwd(form){
  if ($("#m_name").val()==""){
      alert("이름을 입력해 주세요.");
	  $("#m_name").focus();
	  return false;
  }

  if ($("#m_id").val()==""){
      alert("이메일 주소를 입력해 주세요.");
	  $("#m_id").focus();
	  return false;
  }
}


// 자바스크립트로 PHP의 number_format 흉내를 냄
// 숫자에 , 를 출력
function number_format(data)
{

    var tmp = '';
    var number = '';
    var cutlen = 3;
    var comma = ',';
    var i;

    var sign = data.match(/^[\+\-]/);
    if(sign) {
        data = data.replace(/^[\+\-]/, "");
    }

    len = data.length;
    mod = (len % cutlen);
    k = cutlen - mod;
    for (i=0; i<data.length; i++)
    {
        number = number + data.charAt(i);

        if (i < data.length - 1)
        {
            k++;
            if ((k % cutlen) == 0)
            {
                number = number + comma;
                k = 0;
            }
        }
    }

    if(sign != null)
        number = sign+number;

    return number;
}


function limit_text(max,id){
	var count = $("#"+id+"").val().length;
	if(count > max){
		alert("메시지는 공백 포함 "+max+"글자 까지만 작성하실 수 있습니다.");
		var strlen = $("#"+id+"").val().length-1;
		var con_val = $("#"+id+"").val();
		var input_val = con_val.substring(0, strlen);
		count = strlen;
		$("."+id+"").text(strlen);
		$("#"+id+"").val(input_val);
	}
	$("."+id+"").text(count);
}

$(function(){

	$("#email3").change(function(){
		var email = $(this).val();
		if (email == ""){
			$("#email2").val('')
			$("#email2").focus()
		}else{
			 $("#email2").val(email);
		}
	});

	$(".chkall").click(function(){
		if($(this).prop("checked") === true){
			$(".chk").each(function(){
				$(this).prop("checked",true);
			});
		}else{
			$(".chk").each(function(){
				$(this).prop("checked",false);
			});
		}
	});

	//자동등록방지코드
	$(".sec_code").click(function(){
		$.ajax({ 
			type: "POST", 
			url: "/include/plugin/kcaptcha/index.php", 
			data: "data=12",
			success: function(data){ 
				if(data){
						$('.sec_code img').attr('src', '/include/plugin/kcaptcha/?' + (new Date).getTime());
				}
			}
		});

	});
});