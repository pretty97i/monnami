<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
	
	int member_id = (Integer) session.getAttribute("member_id");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<jsp:include page="/monnami/content/monnamiTop.jsp" />

</head>

<head>
<title>모나미 공식 쇼핑몰 모나미몰</title>
<meta charset="UTF-8">
<meta http-equiv="p3p" content="CP=&quot;ALL CURa ADMa DEVa TAIa OUR BUS IND PHY ONL UNI PUR FIN COM NAV INT DEM CNT STA POL HEA PRE LOC OTC&quot; ">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="format-detection" content="telephone=no, email=no, address=no">
<meta name="keywords" content="">
<meta name="description" content="문구, 모나미펫, 크래프트&amp;하비, 모나르떼를 통합한 라이프스타일 편집샵">


<link rel="canonical" href="https://www.monamimall.com/w/main.do">
<link rel="stylesheet" href="/study/monnami/css/product/productDetail.css">

 
<!-- 네이버유입스크립트 -->
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript"> 
	var currentUrl = window.location.href;
	if(!currentUrl.match("/order/orderComplete.do")){
		if(currentUrl.match("/member/joinComplete.do") || currentUrl.match("/member/joinSsoComplete.do")){
			var _nasa={};
			_nasa["cnv"] = wcs.cnv("2","0"); // 전환유형, 전환가치 설정해야함. 설치매뉴얼 참고
		}else{
			var _nasa={};
			_nasa["cnv"] = wcs.cnv("5","0"); // 전환유형, 전환가치 설정해야함. 설치매뉴얼 참고
		}
	}
</script> 


<meta name="decorator" content="default.main">
<meta name="bodycss" content="stationery">

<script>
	/* 현진 - 사진바꾸기 */
	function fimg(csrc){
	
	window.document.images["img1"].src=csrc;
	
	}

	$(document).ready(function(){
		settingInit();  // 설정정보 초기화
		dataInit();     // 데이터로딩 및 변수 초기화
		displayInit();  // 옵션, 상품 리뷰 등 초기화
		btnInit();
	});

	function settingInit() {
		// javascript 로그를 확인하고 싶은경우 true, 로그표시를 없애려면 false;
		_ut.setDevMode(false);

		// Context root 설정
		_da.setContext("/w");
		
		// 이미지 경로 설정
		_da.setSiteId("MONAMI_MALL");
		_da.setImgDomain("https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer");
		_da.setData("domain", "https://www.monamimall.com");
		_da.setData("mdomain", "https://m.monamimall.com");
		
		// 클럽아이디
		_da.setData("clubMasterIdx", "");
		_da.setData("myClubList", []);
		_da.setData("selClubList", []);
		
		//리뷰 현재 페이지
		_da.setData("cPage", 1);
		_da.setData("kindType","");
		_da.setData("sortType","");
		_da.setData("ROWCNT_PERPAGE", 8);
		
		_da.setData("petTypeIdx", "");
		
	
		//부가서비스
		_da.setData("addServiceYn","N"); //사용자가 사용을 선택한 경우 Y로 변경
		_da.setData("addPrice", "0"); //사용자가 사용을 선택한 경우 Y로 변경
		_da.setData("addServiceContent",""); //사용자가 사용을 선택한 경우 Y로 변경
		_da.setData("addServiceType","ADD_A"); //'ADD_A' : 모나미 각인 서비스, 'ADD_B' : 일반각인 서비스
		
		
		//인증확인 실행 여부
		_da.setData("authCheckYn","N");
		//인증확인 성공 여부
		_da.setData("authCheckSuccessYn","N");
	}
	
	function dataInit() {
		_ut.log("dataInit");
		optionDataInit();
	}
	
	function optionDataInit() {
		_ut.log("optionDataInit");
		// Ajax 호출 초기화
		var pa = _ut.getAjaxParam("POST", false, _da.getContext(), "요청하신 정보가 없습니다."); 
		pa.url = _da.getContext() + "/ajax/product/productDetailOptionAjax.do";
		pa.data = { siteId: _da.getSiteId(), goodsNo: "MG000003580" };

		
		// Ajax 호출
		var result = _ut.callAjax(pa, function(retObj){
			if(_.isObject(retObj)) {
				_ut.log("optionDataInit : retObj ====", retObj);
				
				//상품정보조회
				if(_.isObject(retObj.goods)) { _da.setData("goods", retObj.goods); }
				
				//상품구매옵션조회
				if(_.isArray(retObj.optionList)) { _da.setData("optionList", retObj.optionList); }
				
				//옵션상품구매옵션조회
				if(_.isArray(retObj.goodsOptionList)) { _da.setData("goodsOptionList", retObj.goodsOptionList); }

				//옵션상품조회
				if(_.isArray(retObj.goodsOptionItemList)) { _da.setData("goodsOptionItemList", retObj.goodsOptionItemList); }
				
				//선택옵션상품조회
				_da.setData("selGoodsOptionItemList", []);
			}
		});
		
		_ut.log("optionDataInit : DATA_LIST ====", _da.DATA_LIST);
	}
	
	
	function displayInit() {
		_ut.log("displayInit");
		
		if(_da.getData("goods").itemState === "0") {
			if(_da.getData("goods").optionUseYn === "Y") {
				optionDisplayInit();
			}
			
			if(_da.getData("goods").optionUseYn === "N") {
				noOptionDisplayInit();
			}
		}
	}
	
	function _optionChange(pOrderIdx, optionNm, optionIdx, optionImgList) {
		_ut.log("_optionChange");
		_ut.log("optionIdx == ", optionIdx);
		_ut.log("pOrderIdx == ", pOrderIdx);
		_ut.log("optionNm == ", optionNm);
		_ut.log("optionImgList == ", optionImgList);
		
		//var optionListCnt = _.where(_da.getData("optionList"), {pOptionIdx : 0}).length;
			
		//분리형인경우
		if(_da.getData("goods").optionDisplayType === "B") {
			
			//옵션 레벨에 따라 선택한, 옵션값일련번호 지정
			_da.setData("pOrderIdx_"+pOrderIdx+"_optionIdx", optionIdx);
			
			
			var inCurPorderIdx = (typeof pOrderIdx === "string")?parseInt(pOrderIdx):pOrderIdx;
			var curOptionLevelObj = _.findWhere(_da.getData("optionLevelPorderIdx"), {pOrderIdx : inCurPorderIdx});
			
			_ut.log("curOptionLevelObj ===== ", curOptionLevelObj);
			_ut.log("optionLevel ===== ", _da.getData("optionLevel"));
			
			if(_.isObject(curOptionLevelObj) && $.isNumeric(curOptionLevelObj.optionLevel)) {
				//옵션을 선택하면 다음 옵션목록을 표시
				if(parseInt(_da.getData("optionLevel"))-1 >= parseInt(curOptionLevelObj.optionLevel) && optionIdx !== "") {
					var curPorderIdx = inCurPorderIdx; //parseInt(pOrderIdx);
					var curPorderArrIdx = curOptionLevelObj.optionLevel-1;
					
					var trgPorderIdx = 0;
					var trgPorderArrIdx = 0;
					var trgOptionLevelObj = _.findWhere(_da.getData("optionLevelPorderIdx"), {optionLevel : curOptionLevelObj.optionLevel + 1});
					if(_.isObject(curOptionLevelObj)) {
						trgPorderIdx = trgOptionLevelObj.pOrderIdx;
						trgPorderArrIdx = trgOptionLevelObj.optionLevel - 1
					}
					
					_ut.log("trgPorderIdx === ", trgPorderIdx);
					_ut.log("trgPorderArrIdx === ", trgPorderArrIdx);
					
					
					
					//다음 옵션의 옵션아이디 목록과 옵션객체 목록 조회
					var trgOptionIdxList = [];
					var trgOptionObjList = [];
					
					_.map(_da.getData("goodsOptionItemList"), function(obj) {
						if(!_.isUndefined(obj.optionIdxList) && obj.optionIdxList !== "") {
							var curOptionIdx = obj.optionIdxList.split("_")[curPorderArrIdx];
							if(optionIdx === curOptionIdx) {
								var trgOptionIdx =  obj.optionIdxList.split("_")[trgPorderArrIdx];
								trgOptionIdxList.push(trgOptionIdx);
							}
						}
					});

					//중복제거
					trgOptionIdxList = _.uniq(trgOptionIdxList);
					
					_.map(trgOptionIdxList, function(trgOptionIdx) {
						var findOptionObj = _.findWhere(_da.getData("optionList"), {optionIdx : parseInt(trgOptionIdx)});
						if(_.isObject(findOptionObj)) {
							trgOptionObjList.push(findOptionObj);
						}
					});
					
					
					//마지막옵션의 2단계전까지는 선택된 옵션에 따라 옵션값만을 설정, 1,2, 3
					if(parseInt(_da.getData("optionLevel"))-1 > parseInt(curOptionLevelObj.optionLevel) && optionIdx !== "") {
						_ut.log("add before last level");
						
						
						var trgOptionObj = _.findWhere(_da.getData("optionList"), {pOrderIdx: trgPorderIdx, pOptionIdx: 0});
						if(_.isObject(trgOptionObj) && trgOptionObjList.length > 0) {
							var optionObj_A = _cv.getOptionRow("A", trgOptionObj, trgOptionObjList,"선택해주세요", _da);
							var optionObj_B = _cv.getOptionRow("B", trgOptionObj, trgOptionObjList,"선택해주세요", _da);
							$("#pOrderIdx_A_"+trgPorderIdx).after(optionObj_A.li);
							$("#pOrderIdx_A_"+trgPorderIdx).remove();
							$("#pOrderIdx_B_"+trgPorderIdx).after(optionObj_B.li);
							$("#pOrderIdx_B_"+trgPorderIdx).remove();
							
							_.map(optionObj_A.list, function(obj) {
								obj.click(function() {
									var pOrderIdx = $(this).attr("data-pOrderIdx");
									var optionIdx = $(this).attr("data-value");
									var optionImgList = $(this).attr("data-optionImgList");
									var optionImgListCnt = $(this).attr("data-optionImgListCnt");
									var optionNm = $(this).attr("data-optionNm");
									
									if(optionIdx !== "") {
										_syncSelOption("cur_B_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
										_optionChange(pOrderIdx, optionNm, optionIdx, optionImgList);
									}else{
										_syncSelOption("cur_B_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
										//옵션을 선택한후 다시 처음 옵션을 변경하면 나머지 옵션은 초기화 되어야 함
										_selOptionReset(parseInt(pOrderIdx));
									}
								});
							});
							
							_.map(optionObj_B.list, function(obj) {
								obj.click(function() {
									var pOrderIdx = $(this).attr("data-pOrderIdx");
									var optionIdx = $(this).attr("data-value");
									var optionImgList = $(this).attr("data-optionImgList");
									var optionImgListCnt = $(this).attr("data-optionImgListCnt");
									var optionNm = $(this).attr("data-optionNm");

									if(optionIdx !== "") {
										_syncSelOption("cur_A_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
										_optionChange(pOrderIdx, optionNm, optionIdx, optionImgList);
									}else{
										_syncSelOption("cur_A_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
										//옵션을 선택한후 다시 처음 옵션을 변경하면 나머지 옵션은 초기화 되어야 함
										_selOptionReset(parseInt(pOrderIdx));
									}
								});
							});
						}
					}
					
					//마지막옵션 바로 전단계에는, 가격정보등을 구해 마지막 옵션에 설정
					if(parseInt(_da.getData("optionLevel"))-1 === parseInt(curOptionLevelObj.optionLevel) && optionIdx !== "") {
						_ut.log("add last level");
						var selOptionList = [];
						var optionLevel = parseInt(_da.getData("optionLevel"));
						for(var i = 1; i < optionLevel ; i++) {
							var chkPorderIdxObj = _.findWhere(_da.getData("optionLevelPorderIdx"), {optionLevel : i});
							if(_.isObject(chkPorderIdxObj)) {
								var selOption = {}
								selOption.pOrderIdx = chkPorderIdxObj.pOrderIdx;
								selOption.optionIdx = parseInt(_da.getData("pOrderIdx_"+chkPorderIdxObj.pOrderIdx+"_optionIdx"));
								selOptionList.push(selOption);
							}
						}
						
						_ut.log("selOptionList ==== ", selOptionList);
						
						var trgOptionObj = _.findWhere(_da.getData("optionList"), {pOrderIdx: trgPorderIdx, pOptionIdx: 0});
						_ut.log("trgOptionObj === ", trgOptionObj);
						
						var optionIdxList = _.pluck(selOptionList, "optionIdx").join("_");
						_ut.log("optionIdxList === ", optionIdxList);
						

						
						trgOptionObjList = _.chain(trgOptionObjList)
						.filter(function(obj) {
							return _.isObject(_.findWhere(_da.getData("goodsOptionItemList"), {optionIdxList : optionIdxList+"_"+obj.optionIdx}));
						})
						.map(function(obj) {
							var goodsOptionItemObj = _.findWhere(_da.getData("goodsOptionItemList"), {optionIdxList : optionIdxList+"_"+obj.optionIdx});
							obj.priceAdd = goodsOptionItemObj.priceAdd;
							obj.itemState = goodsOptionItemObj.itemState;
							obj.totalStockCnt = goodsOptionItemObj.totalStockCnt;
							return obj;
						}).value();
						
						_ut.log("Last Option : trgOptionObjList === ", trgOptionObjList);
						_ut.log("Last Option : trgPorderIdx === ", trgPorderIdx);
						
						
						if(_.isObject(trgOptionObj) && trgOptionObjList.length > 0) {
							var optionObj_A = _cv.getOptionRowLast("A", trgOptionObj, trgOptionObjList, "선택해주세요", _da);
							var optionObj_B = _cv.getOptionRowLast("B", trgOptionObj, trgOptionObjList, "선택해주세요", _da);
							$("#pOrderIdx_A_"+trgPorderIdx).after(optionObj_A.li);
							$("#pOrderIdx_A_"+trgPorderIdx).remove();
							$("#pOrderIdx_B_"+trgPorderIdx).after(optionObj_B.li);
							$("#pOrderIdx_B_"+trgPorderIdx).remove();
							
							_.map(optionObj_A.list, function(obj) {
								obj.click(function() {
									var pOrderIdx = $(this).attr("data-pOrderIdx");
									var optionIdx = $(this).attr("data-value");
									var optionImgList = $(this).attr("data-optionImgList");
									var optionImgListCnt = $(this).attr("data-optionImgListCnt");
									var optionNm = $(this).attr("data-optionNm");

									if(optionIdx !== "") {
										_syncSelOption("cur_B_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
										
										var addOptionIdxList = optionIdxList + "_" + optionIdx;
										_ut.log("addOptionIdxList ===", addOptionIdxList);
										_addSelGoodsOptionItem(addOptionIdxList);
									}else{
										_syncSelOption("cur_B_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
										
										//옵션을 선택한후 다시 처음 옵션을 변경하면 나머지 옵션은 초기화 되어야 함
										_selOptionReset(parseInt(pOrderIdx));
									}
								});
							});
							
							_.map(optionObj_B.list, function(obj) {
								obj.click(function() {
									var pOrderIdx = $(this).attr("data-pOrderIdx");
									var optionIdx = $(this).attr("data-value");
									var optionImgList = $(this).attr("data-optionImgList");
									var optionImgListCnt = $(this).attr("data-optionImgListCnt");
									var optionNm = $(this).attr("data-optionNm");

									if(optionIdx !== "") {
										_syncSelOption("cur_A_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
										
										var addOptionIdxList = optionIdxList + "_" + optionIdx;
										_ut.log("addOptionIdxList ===", addOptionIdxList);
										_addSelGoodsOptionItem(addOptionIdxList);
									}else{
										_syncSelOption("cur_A_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
										//옵션을 선택한후 다시 처음 옵션을 변경하면 나머지 옵션은 초기화 되어야 함
										_selOptionReset(parseInt(pOrderIdx));
									}
								});
							});
						}
					}
					
					//옵션을 선택한후 다시 처음 옵션을 변경하면 나머지 옵션은 초기화 되어야 함
					_selOptionReset(trgPorderIdx);
				}
			}
		}
	}
	
	function _syncSelOption(targetId, optionImgListCnt, optionImgList, optionNm) {
		if(!_.isString(targetId) || !_.isString(optionImgListCnt) || !_.isString(optionImgList) || !_.isString(optionNm)) return false;
		
		$("#"+targetId).empty();
		if(parseInt(optionImgListCnt) > 0) {
			var imgSrcArr = optionImgList.split(",");
			_.map(imgSrcArr, function(src) {
				var optImg = _cv.getImg().attr("src", src);
				$("#"+targetId).append(optImg);
			});
		}
		$("#"+targetId).append(optionNm);
		return true;
	}
	
	
	function _addSelGoodsOptionItem(optionIdxList) {
		_ut.log("_addSelGoodsOptionItem");
		_ut.log("optionIdxList === ", optionIdxList);
		
		var selGoodsOptionItemObj = _.findWhere(_da.getData("selGoodsOptionItemList"), {optionIdxList: optionIdxList});
		if(_.isObject(selGoodsOptionItemObj)) {
			alert("이미선택한 옵션입니다!");
			//_selOptionInit();
			return false;
		}
		// 옵션입력
		var goodsOptionItemObj = _.findWhere(_da.getData("goodsOptionItemList"), {optionIdxList : optionIdxList});
		if(_.isObject(goodsOptionItemObj)) {
			var goodsOptionItemObj = _ut.copyObject(_da.getSelGoodsOptionItemObj(), goodsOptionItemObj)
			_ut.log("input : goodsOptionItemObj === ", goodsOptionItemObj);
			_da.getData("selGoodsOptionItemList").push(goodsOptionItemObj);
			var func = {};
			func._setTotalPrice = _setTotalPrice;
			func._restockAlarm = _restockAlarm;
			$("#selOption_A").append(_cv.getGoodsOptionItemRow("A", goodsOptionItemObj, _da, func));
			$("#selOption_B").append(_cv.getGoodsOptionItemRow("B", goodsOptionItemObj, _da, func));
			_setTotalPrice();
		}
		
	}
	
	
	
	function noOptionDisplayInit() {
		_ut.log("noOptionDisplayInit");

		if(_da.getData("goodsOptionItemList").length === 1) {
			var goodsOptionItemObj = _ut.copyObject(_da.getSelGoodsOptionItemObj(), _da.getData("goodsOptionItemList")[0]);
			goodsOptionItemObj.optionNmList = _da.getData("goods").goodsNm;
			_da.getData("selGoodsOptionItemList").push(goodsOptionItemObj);
			var func = {};
			func._setTotalPrice = _setTotalPrice;
			func._restockAlarm = _restockAlarm;
			$("#selOption_A").append(_cv.getGoodsOptionItemRow("A", goodsOptionItemObj, _da, func));
			$("#selOption_B").append(_cv.getGoodsOptionItemRow("B", goodsOptionItemObj, _da, func));
			_setTotalPrice();
		}
	}
	
	
	function _setTotalPrice() {
		var totalSum = 0;
		var selOptionCnt = 0;
		_.chain(_da.getData("selGoodsOptionItemList"))
			.filter(function(obj) { return obj.itemState === "0" && obj.totalStockCnt !== "0" &&  obj.totalStockCnt !== 0; })
			.map(function(obj) {
				var price = (typeof obj.price === "string")?parseInt(obj.price):obj.price;
				var selCnt = (typeof obj.selCnt === "string")?parseInt(obj.selCnt):obj.selCnt;
				return {val : (price * selCnt), selCnt : selCnt};
			}).map(function(obj) {
				totalSum = totalSum + obj.val;
				if(_da.getData("addServiceYn") === "Y") {
					var addPrice = (typeof _da.getData("addPrice") === "string")?parseInt(_da.getData("addPrice")):_da.getData("addPrice");
					var selCnt = (typeof obj.selCnt === "string")?parseInt(obj.selCnt):obj.selCnt;
					totalSum = totalSum + addPrice*selCnt;
				}
				selOptionCnt = selOptionCnt + 1;
			});
		_ut.log("totalSum ===", totalSum);
		$("#totalPrice_A").text(_ut.commaStr(totalSum.toString()));
		$("#totalPrice_B").text(_ut.commaStr(totalSum.toString()));
		$("#totalSelCnt_B").text(_ut.commaStr(selOptionCnt.toString()));
	}
		
	function _selOptionInit() {
		_ut.log("_selOptionInit");
		
		var optionLevel = parseInt(_da.getData("optionLevel"));
		for(var i = 1; i < optionLevel; i++) {
			_da.delData("pOrderIdx_"+i+"_optionIdx");
		}
		
		$("#optionArea_A").find("*").not("#addServiceA").remove();
		$("#optionArea_B").find("*").not("#addServiceB").remove();
		
		optionDisplayInit();
	}
	
	
	function _selOptionReset(trgPorderIdx) {
		if(!_.isNumber(trgPorderIdx)) return false;
		
		//옵션을 선택한후 다시 처음 옵션을 변경하면 나머지 옵션은 초기화 되어야 함
		_.chain(_da.getData("optionList"))
		.where({pOptionIdx : 0})
		.filter(function(obj) { return obj.pOrderIdx > trgPorderIdx; })
		.sortBy(function(obj) { return (typeof obj.pOrderIdx === "string" && $.isNumeric(obj.pOrderIdx)) ? parseInt(obj.pOrderIdx) : obj.pOrderIdx; }) 
		.map(function(obj, idx) {
			var optionObj_A = _cv.getOptionRow("A", obj, [], "선택해주세요", _da);
			var optionObj_B = _cv.getOptionRow("B", obj, [], "선택해주세요", _da);
			$("#pOrderIdx_A_"+obj.pOrderIdx).after(optionObj_A.li);
			$("#pOrderIdx_A_"+obj.pOrderIdx).remove();
			
			$("#pOrderIdx_B_"+obj.pOrderIdx).after(optionObj_B.li);
			$("#pOrderIdx_B_"+obj.pOrderIdx).remove();
			
			_da.delData("pOrderIdx_"+obj.pOrderIdx+"_optionIdx");
		});
	}
	
	function optionDisplayInit() {
		_ut.log("optionDisplayInit")
		_ut.log("optionUseYn === ", _da.getData("goods").optionUseYn);
		_ut.log("optionDisplayType === ", _da.getData("goods").optionDisplayType);
		
		var optionListCnt = _.where(_da.getData("optionList"), {pOptionIdx : 0}).length;
		
		_ut.log("optionListCnt === ", optionListCnt);
		
		//_da.setData("optionLevel", _da.getMaxIdx("pOrderIdx", _da.getData("optionList")));
		
		_da.setData("optionLevel", _.where(_da.getData("optionList"),{pOptionIdx : 0}).length);
		_da.setData("optionLevelPorderIdx", []);
		
		
		_ut.log("optionLevel === ", _da.getData("optionLevel"));
				
		
		if(_da.getData("goods").optionUseYn === "N") return false;
		
		if(_da.getData("optionList").length > 0) {
			_ut.log("optionList.length > 0");
			
			//일체형인경우
			if(_da.getData("goods").optionDisplayType === "A") {
				var trgOptionObjList = _.chain(_da.getData("goodsOptionItemList"))
				.map(function(obj) {
					return obj;
				}).value();
				
				_ut.log("trgOptionObjList === ", trgOptionObjList);
				
				if(trgOptionObjList.length > 0) {
					//A 타입 : 상단옵션, B 타입 : 하단옵션
					var optionObj_A = _cv.getOptionRowUnion("A", trgOptionObjList, "선택해주세요", _da);
					var optionObj_B = _cv.getOptionRowUnion("B", trgOptionObjList, "선택해주세요", _da);
					
					$("#optionArea_A").prepend(optionObj_A.li);
					
					$("#optionArea_B").prepend(optionObj_B.li);
					
					_.map(optionObj_A.list, function(obj) {
						obj.click(function() {
							
							var addOptionIdxList = $(this).attr("data-optionIdxList");
							var optionImgList = $(this).attr("data-optionImgList");
							var optionImgListCnt = $(this).attr("data-optionImgListCnt");
							var optionNm = $(this).attr("data-optionNm");

							if(_.isString(addOptionIdxList) && addOptionIdxList !== "") {
								_syncSelOption("cur_B", optionImgListCnt, optionImgList, optionNm);
								_addSelGoodsOptionItem(addOptionIdxList);
							}else{
								_syncSelOption("cur_B", optionImgListCnt, optionImgList, optionNm);
							}
							
						});
					});
					
					_.map(optionObj_B.list, function(obj) {
						obj.click(function() {
							var addOptionIdxList = $(this).attr("data-optionIdxList");
							var optionImgList = $(this).attr("data-optionImgList");
							var optionImgListCnt = $(this).attr("data-optionImgListCnt");
							var optionNm = $(this).attr("data-optionNm");

							if(_.isString(addOptionIdxList) && addOptionIdxList !== "") {
								_syncSelOption("cur_A", optionImgListCnt, optionImgList, optionNm);
								_addSelGoodsOptionItem(addOptionIdxList);
							}else{
								_syncSelOption("cur_A", optionImgListCnt, optionImgList, optionNm);
							}
						});
					});
				}
			}
			
			//분리형인경우
			if(_da.getData("goods").optionDisplayType === "B") {
				//부모 옵션을 조회하고, 부모옵션정렬 순서에 따라 정렬
				
				var optionLevelPorderIdx = [];
				
				_.chain(_da.getData("optionList"))
						.where({pOptionIdx : 0})
						.sortBy(function(obj) { return (typeof obj.pOrderIdx === "string" && $.isNumeric(obj.pOrderIdx)) ? parseInt(obj.pOrderIdx) : obj.pOrderIdx; }) 
						.map(function(obj, idx) {
							_ut.log("pOptionObj = ", obj);
							
							var optionLevelPorderIdxObj = {};
							optionLevelPorderIdxObj.optionLevel = (idx+1);
							optionLevelPorderIdxObj.pOrderIdx = obj.pOrderIdx;
							optionLevelPorderIdx.push(optionLevelPorderIdxObj);
							
							var optionNm = obj.optionNm;
							
							// 첫번째 옵션은 옵션값을 전부 설정
							if(idx === 0) {
								var cList = _.where(_da.getData("optionList"), {pOptionIdx: obj.optionIdx});
								
								var optionObj_A = {};
								var optionObj_B = {};
								
								if(_da.getData("optionLevel") === 1) {
									
									var trgOptionObjList = _.chain(cList)
									.filter(function(obj) {
										var curOptionIdx = (typeof obj.optionIdx === "number")?obj.optionIdx.toString():obj.optionIdx;
										_ut.log("curOptionIdx ==== ",curOptionIdx);
										return _.isObject(_.findWhere(_da.getData("goodsOptionItemList"), {optionIdxList : curOptionIdx}));
									})
									.map(function(obj) {
										_ut.log("option : obj ===== ", obj);
										var curOptionIdx = (typeof obj.optionIdx === "number")?obj.optionIdx.toString():obj.optionIdx;
										var goodsOptionItemObj = _.findWhere(_da.getData("goodsOptionItemList"), {optionIdxList : curOptionIdx});
										_ut.log("option : goodsOptionItemObj ===== ", goodsOptionItemObj);
										obj.priceAdd = goodsOptionItemObj.priceAdd;
										obj.itemState = goodsOptionItemObj.itemState;
										obj.totalStockCnt = goodsOptionItemObj.totalStockCnt;
										return obj;
									}).value();
									optionObj_A = _cv.getOptionRowLast("A", obj, trgOptionObjList,"선택해주세요", _da);
									optionObj_B = _cv.getOptionRowLast("B", obj, trgOptionObjList,"선택해주세요", _da);
									$("#optionArea_A").prepend(optionObj_A.li);
									$("#optionArea_B").prepend(optionObj_B.li);
									
									_.map(optionObj_A.list, function(obj) {
										obj.click(function() {
											var pOrderIdx = $(this).attr("data-pOrderIdx");
											var optionIdx = $(this).attr("data-value");
											var optionImgList = $(this).attr("data-optionImgList");
											var optionImgListCnt = $(this).attr("data-optionImgListCnt");
											var optionNm = $(this).attr("data-optionNm");

											if(optionIdx !== "") {
												_syncSelOption("cur_B_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
												
												var addOptionIdxList = optionIdx;
												_ut.log("addOptionIdxList ===", addOptionIdxList);
												_addSelGoodsOptionItem(addOptionIdxList);
											}else{
												_syncSelOption("cur_B_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
												
												//옵션을 선택한후 다시 처음 옵션을 변경하면 나머지 옵션은 초기화 되어야 함
												_selOptionReset(parseInt(pOrderIdx));
											}
										});
									});
									
									_.map(optionObj_B.list, function(obj) {
										obj.click(function() {
											var pOrderIdx = $(this).attr("data-pOrderIdx");
											var optionIdx = $(this).attr("data-value");
											var optionImgList = $(this).attr("data-optionImgList");
											var optionImgListCnt = $(this).attr("data-optionImgListCnt");
											var optionNm = $(this).attr("data-optionNm");

											if(optionIdx !== "") {
												_syncSelOption("cur_A_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
												
												var addOptionIdxList = optionIdx;
												_ut.log("addOptionIdxList ===", addOptionIdxList);
												_addSelGoodsOptionItem(addOptionIdxList);
											}else{
												_syncSelOption("cur_A_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
												//옵션을 선택한후 다시 처음 옵션을 변경하면 나머지 옵션은 초기화 되어야 함
												_selOptionReset(parseInt(pOrderIdx));
											}
										});
									});
								}
								
								if(_da.getData("optionLevel") > 1) {
									optionObj_A = _cv.getOptionRow("A", obj, cList,"선택해주세요", _da);
									optionObj_B = _cv.getOptionRow("B", obj, cList,"선택해주세요", _da);
									$("#optionArea_A").prepend(optionObj_A.li);
									$("#optionArea_B").prepend(optionObj_B.li);
									
									_.map(optionObj_A.list, function(obj) {
										obj.click(function() {
											var pOrderIdx = $(this).attr("data-pOrderIdx");
											var optionIdx = $(this).attr("data-value");
											var optionImgList = $(this).attr("data-optionImgList");
											var optionImgListCnt = $(this).attr("data-optionImgListCnt");
											var optionNm = $(this).attr("data-optionNm");

											if(optionIdx !== "") {
												_syncSelOption("cur_B_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
												_optionChange(pOrderIdx, optionNm, optionIdx, optionImgList);
											}else{
												_syncSelOption("cur_B_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
												//옵션을 선택한후 다시 처음 옵션을 변경하면 나머지 옵션은 초기화 되어야 함
												_selOptionReset(parseInt(pOrderIdx));
											}
										});
									});
									
									_.map(optionObj_B.list, function(obj) {
										obj.click(function() {
											var pOrderIdx = $(this).attr("data-pOrderIdx");
											var optionIdx = $(this).attr("data-value");
											var optionImgList = $(this).attr("data-optionImgList");
											var optionImgListCnt = $(this).attr("data-optionImgListCnt");
											var optionNm = $(this).attr("data-optionNm");

											if(optionIdx !== "") {
												_syncSelOption("cur_A_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
												_optionChange(pOrderIdx, optionNm, optionIdx, optionImgList);
											}else{
												_syncSelOption("cur_A_"+pOrderIdx, optionImgListCnt, optionImgList, optionNm);
												//옵션을 선택한후 다시 처음 옵션을 변경하면 나머지 옵션은 초기화 되어야 함
												_selOptionReset(parseInt(pOrderIdx));
											}
										});
									});
								}
																
								
							}
							
							// 첫번째 옵션이 아닌경우 옵션값을 설정하지 않고, 이전옵션 선택에 따라 결정됨
							if(idx !== 0) {
								var optionObj_A = _cv.getOptionRow("A", obj, [], "선택해주세요", _da);
								var optionObj_B = _cv.getOptionRow("B", obj, [], "선택해주세요", _da);
								$("#optionArea_A > li:nth-child("+(idx)+")").after(optionObj_A.li);
								$("#optionArea_B > li:nth-child("+(idx)+")").after(optionObj_B.li);
							}
						});
				
						_da.setData("optionLevelPorderIdx", optionLevelPorderIdx);
						
						_ut.log("optionLevelPorderIdx ==== ", _da.getData("optionLevelPorderIdx"));
				}
			}
		
		
	}
	

	function _restockAlarm(optionItemIdx) {
		_ut.log("_restockAlarm");
		_ut.log("optionItemIdx ==== ", optionItemIdx);
		
			if(confirm("로그인 후 이용 가능합니다. 로그인 하시겠습니까?")){
				location.href="/w/login/loginPage.do?refererYn=Y";
			}
			return false;
		

		if(!_.isUndefined(optionItemIdx)) {			
			var goodsNm = _da.getData("goods").goodsNm;
			var goodsOptionItemObj = _.findWhere(_da.getData("goodsOptionItemList"), {optionItemIdx: optionItemIdx});
			if(_.isObject(goodsOptionItemObj)) {
				goodsNm = goodsNm + " - " + goodsOptionItemObj.optionNmList;
				$("#restockAlarm_goodsNm").append(goodsNm);
				$("#restockAlarm_optionItemIdx").val(goodsOptionItemObj.optionItemIdx);
				fn.popupOpen('#popDetailWarehousing');
			}
		}
	}
	
	
	
	
	function _confirmRestockAlarm() {
		_ut.log("_restockAlarm");
		
		var phone = $("#restockAlarm_phone").val();
		var optionItemIdx = $("#restockAlarm_optionItemIdx").val();
		
		
		if(!$.isNumeric(phone)) {
			alert("전화번호는 숫자만 입력해 주세요");
			return false;
		}
		
		if(phone.length !== 10 && phone.length !== 11) {
			alert("전화번호를 정확히 입력해 주세요");
			return false;
		}
		
		
		// Ajax 호출
		
		var pa = _ut.getAjaxParam("POST", false, _da.getContext(), "요청하신 정보가 없습니다."); 
		pa.url = _da.getContext() + "/ajax/product/productRestockAlarmAjax.do";
		pa.data = { siteId: _da.getSiteId(), optionItemIdx: optionItemIdx , alarmTel : phone};
		
		// Ajax 호출
		var restockAlarmList = [];
		var result = _ut.callAjax(pa, function(retObj){
			_ut.log("retObj ===", retObj);
			
			if(_.isObject(retObj)) {
				if(retObj.result == "login") {

					 if(confirm("재입고 알람을 받으시려면 로그인이 필요합니다. 로그인 하시겠습니까?")){
							location.href=getContextPath()+"/login/loginPage.do?refererYn=Y"; 
					 }
					 return false;
				}
				
				if(retObj.restockAlarmList.length > 0) {
					restockAlarmList = retObj.restockAlarmList; 
				}
			}
		});
		
	
		if(restockAlarmList.length > 0) {
			alert("재입고 알림신청이 이미 등록되어 있습니다.");
			return false;
		}
		
		// Ajax 호출 초기화
		var pa2 = _ut.getAjaxParam("POST", false, _da.getContext(), "요청하신 정보가 없습니다."); 
		pa2.url = _da.getContext() + "/ajax/product/productRestockAlarmSaveAjax.do";
		pa2.dataType = "json";
		pa2.contentType = "application/json; charset=UTF-8";
		
		var obj = {siteId: _da.getSiteId(), optionItemIdx: optionItemIdx , alarmTel : phone};
		if(_.isUndefined(_da.getData("registerId")) && _da.getData("registerId") !== "") {
			obj.registerId = _da.getData("registerId");
		}
		pa2.data = JSON.stringify(obj);

		// Ajax 호출
		var result =  _ut.callAjax(pa2, function(retObj){
			_ut.log("retObj 1111 === ", retObj);
			if(_.isArray(retObj)) {
				_ut.log("retObj 222 ===", retObj);
			}
		});	
		

		$("#restockAlarm_goodsNm").empty();
		$("#restockAlarm_phone").val("");
		$("#restockAlarm_optionItemIdx").val("");
		
		fn.popupClose();
	}
		
	function goCart() {
		_ut.log("goCart()");
		if($("#cartType").val() === "cart") location.href=getContextPath()+"/cart.do";
		if($("#cartType").val() === "wish") location.href=getContextPath()+"/cart.do";
		
	}
	
	function _addCart() {
		_ut.log("_addCart");
		
		if(_da.getData("selGoodsOptionItemList").length === 0) {
			alert("장바구니에 담으실 상품을 선택하여 주세요.");
			return false;
		}
		
		for(var i = 0; i < _da.getData("selGoodsOptionItemList").length; i++) {
			var obj = _da.getData("selGoodsOptionItemList")[i];
			if(obj.itemState === "0" || obj.itemState === 0) {
				if(obj.totalStockCnt === "0" || obj.totalStockCnt === 0) {
					alert("품절상품은 장바구니에 담을 수 없습니다.");
					return false;
				}
			}else{
				alert("품절상품은 장바구니에 담을 수 없습니다.");
				return false;
			}
		}
		
		if(_da.getData("addServiceYn") === "Y") {
			if(_da.getData("addServiceContent") === "") {
				alert("부가서비스 내용을 입력하여 주세요.");
				return false;
			}else{
				_ut.log("addServiceType ==== ", _da.getData("addServiceType"));
				if(_da.getData("addServiceType") === "ADD_A") {
					_ut.log("addServiceContent.length === ", _da.getData("addServiceContent").length);
					if(_da.getData("addServiceContent").length > 10) {
						alert("10자 이내로 입력하시기 바랍니다.");
						return false;
					}
				}
			}
		}
		
		var selGoodsOptionItemList = _.chain(_da.getData("selGoodsOptionItemList"))
		.filter(function(obj) { return obj.itemState === "0"})
		.map(function(obj) {
			var selObj = {};
			selObj.optionItemIdx = obj.optionItemIdx;
			selObj.goodsCnt = obj.selCnt;
			selObj.sessionId = getSessionId();
			selObj.regularYn = "N"
			selObj.clubMasterIdx = null;
			if(_da.getData("addServiceYn") === "Y") {
				selObj.addServiceYn = "Y";
				selObj.addServiceContent = _da.getData("addServiceContent");
				selObj.addServiceType = _da.getData("addServiceType");
			}
			
			if(_da.getData("addServiceYn") === "N") {
				selObj.addServiceYn = "N";
				selObj.addServiceContent = "";
				selObj.addServiceType = "";
			}
			return selObj;
		}).value();

		_ut.log("selGoodsOptionItemList ===", selGoodsOptionItemList);
		
		
		var resultObj = _addCartObject(selGoodsOptionItemList);
		_ut.log("_addCart : resultObj =", resultObj);
		
	
		$("#cartTitle").text("장바구니담기");
		$("#cartText").text(resultObj.msg);
		$("#cartType").val("cart");
		
		
		
		
			fn.popupOpen('#popCartAdd');
		
		
		
	}	
	
	function _addRegularCart() {
		_ut.log("_addRegularCart");
		
		
		if(confirm("로그인 후 이용 가능합니다. 로그인 하시겠습니까?")){
			location.href="/w/login/loginPage.do?refererYn=Y";
		}
			return false;
		
		
		if(_da.getData("selGoodsOptionItemList").length === 0) {
			alert("장바구니에 담으실 상품을 선택하여 주세요.");
			return false;
		}
		
		for(var i = 0; i < _da.getData("selGoodsOptionItemList").length; i++) {
			var obj = _da.getData("selGoodsOptionItemList")[i];
			if(obj.itemState === "0" || obj.itemState === 0) {
				if(obj.totalStockCnt === "0" || obj.totalStockCnt === 0) {
					alert("품절상품은 장바구니에 담을 수 없습니다.");
					return false;
				}
			}else{
				alert("품절상품은 장바구니에 담을 수 없습니다.");
				return false;
			}
		}
		
		if(_da.getData("addServiceYn") === "Y") {
			if(_da.getData("addServiceContent") === "") {
				alert("부가서비스 내용을 입력하여 주세요.");
				return false;
			}else{
				_ut.log("addServiceType ==== ", _da.getData("addServiceType"));
				if(_da.getData("addServiceType") === "ADD_A") {
					_ut.log("addServiceContent.length === ", _da.getData("addServiceContent").length);
					if(_da.getData("addServiceContent").length > 10) {
						alert("10자 이내로 입력하시기 바랍니다.");
						return false;
					}
				}
			}
		}
		
		var selGoodsOptionItemList = _.chain(_da.getData("selGoodsOptionItemList"))
		.filter(function(obj) { return obj.itemState === "0"})
		.map(function(obj) {
			var selObj = {};
			selObj.optionItemIdx = obj.optionItemIdx;
			selObj.goodsCnt = obj.selCnt;
			selObj.sessionId = getSessionId();
			selObj.regularYn = "Y"
			selObj.clubMasterIdx = null;
			if(_da.getData("addServiceYn") === "Y") {
				selObj.addServiceYn = "Y";
				selObj.addServiceContent = _da.getData("addServiceContent");
				selObj.addServiceType = _da.getData("addServiceType");
			}
			
			if(_da.getData("addServiceYn") === "N") {
				selObj.addServiceYn = "N";
				selObj.addServiceContent = "";
				selObj.addServiceType = "";
			}
			return selObj;
		}).value();

		_ut.log("selGoodsOptionItemList ===", selGoodsOptionItemList);
		
		
		var resultObj = _addCartObject(selGoodsOptionItemList);
		_ut.log("_addCart : resultObj =", resultObj);

		
		$("#cartTitle").text("정기배송장바구니담기");
		$("#cartText").text(resultObj.msg);
		$("#cartType").val("wish");
		fn.popupOpen('#popCartAdd');
	}
	
	function _addClubCart() {
		_ut.log("_addClubCart");
		
			if(confirm("로그인 후 이용 가능합니다. 로그인 하시겠습니까?")){
				location.href="/w/login/loginPage.do?refererYn=Y";
			}
			return false;
		
		
		if(_da.getData("selGoodsOptionItemList").length === 0) {
			alert("장바구니에 담으실 상품을 선택하여 주세요.");
			return false;
		}
		
		for(var i = 0; i < _da.getData("selGoodsOptionItemList").length; i++) {
			var obj = _da.getData("selGoodsOptionItemList")[i];
			if(obj.itemState === "0" || obj.itemState === 0) {
				if(obj.totalStockCnt === "0" || obj.totalStockCnt === 0) {
					alert("품절상품은 장바구니에 담을 수 없습니다.");
					return false;
				}
			}else{
				alert("품절상품은 장바구니에 담을 수 없습니다.");
				return false;
			}
		}
		
		if(_da.getData("addServiceYn") === "Y") {
			if(_da.getData("addServiceContent") === "") {
				alert("부가서비스 내용을 입력하여 주세요.");
				return false;
			}else{
				_ut.log("addServiceType ==== ", _da.getData("addServiceType"));
				if(_da.getData("addServiceType") === "ADD_A") {
					_ut.log("addServiceContent.length === ", _da.getData("addServiceContent").length);
					if(_da.getData("addServiceContent").length > 10) {
						alert("10자 이내로 입력하시기 바랍니다.");
						return false;
					}
				}
			}
		}
		
		
		var pa = _ut.getAjaxParam("POST", false, _da.getContext(), "요청하신 정보가 없습니다."); 
		pa.url = _da.getContext() + "/ajax/product/productMyClubListAjax.do";
		pa.data = { memberId : "" };

		
		// Ajax 호출
		var result = _ut.callAjax(pa, function(retObj){
			_ut.log("retObj ===", retObj);
			if(_.isObject(retObj)) {
				if(_.isArray(retObj.myClubList)) {
					_da.setData("myClubList", retObj.myClubList);
				}
			}
		});
		
		
		if(_da.getData("myClubList").length === 0) {
			alert("가입하신 클럽이 없습니다.");
			return false;
		}
		
		$("#clubList").empty();
		$("#clubList").append(_cv.getClubList(_da.getData("myClubList"), _da));
		
		
		fn.popupOpen('#popDetailClub');
	}
	
	function _addClubCartCall() {
		_ut.log("_addClubCartCall");
		
		if(_da.getData("selClubList").length === 0) {
			alert("club을 선택하여 주세요.");
			return false;
		}
		
		if(_da.getData("selGoodsOptionItemList").length === 0) {
			alert("주문하실 상품을 선택하여 주세요.");
			return false;
		}
		
		if(_da.getData("addServiceYn") === "Y") {
			if(_da.getData("addServiceContent") === "") {
				alert("부가서비스 내용을 입력하여 주세요.");
				return false;
			}else{
				_ut.log("addServiceType ==== ", _da.getData("addServiceType"));
				if(_da.getData("addServiceType") === "ADD_A") {
					_ut.log("addServiceContent.length === ", _da.getData("addServiceContent").length);
					if(_da.getData("addServiceContent").length > 10) {
						alert("10자 이내로 입력하시기 바랍니다.");
						return false;
					}
				}
			}
		}
		
		_.map(_da.getData("selClubList"), function(cartObj) {
			var selGoodsOptionItemList = _.chain(_da.getData("selGoodsOptionItemList"))
			.filter(function(obj) { return obj.itemState === "0"})
			.map(function(obj) {
				var selObj = {};
				selObj.optionItemIdx = obj.optionItemIdx;
				selObj.goodsCnt = obj.selCnt;
				selObj.sessionId = getSessionId();
				selObj.regularYn = "N"
				selObj.clubMasterIdx = cartObj.clubMasterIdx;
				
				if(_da.getData("addServiceYn") === "Y") {
					selObj.addServiceYn = "Y";
					selObj.addServiceContent = _da.getData("addServiceContent");
					selObj.addServiceType = _da.getData("addServiceType");
				}
				
				if(_da.getData("addServiceYn") === "N") {
					selObj.addServiceYn = "N";
					selObj.addServiceContent = "";
					selObj.addServiceType = "";
				}
				
				return selObj;
			}).value();
			var resultObj = _addCartObject(selGoodsOptionItemList);
			_ut.log("_addClubCart : resultObj =", resultObj);
			
			
		});
		
		_da.setData("selClubList",[]);
		
		if(confirm("클럽 장바구니로 이동하시겠습니까?")){								
			var frm = document.productDetailForm;
			frm.action="/w/clubCart.do";
			frm.submit();
			fn.popupClose();
		}
		
		fn.popupClose();
		
	}
	

	function _addCartObject(arrayOfGoods){
		var arrObjStr = JSON.stringify(arrayOfGoods);
		var retObj = {};
		$.ajax({			
			url: getContextPath()+"/ajax/cart/addCartAjax.do",
		 	data: arrObjStr,
		 	type: "post",
		 	async: false,
		 	cache: false,
	        dataType : 'json',
	        contentType: "application/json", 
		 	error: function(request, status, error){ 
		 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			},
			success: function(data){
				retObj = data;
				goodsAggrSave('BASKET_CNT'); //집계테이블 장바구니담기 갯수 증가
				$("input[name=addServiceYnA][value='N']").prop("checked",true);
				$("input[name=addServiceYnB][value='N']").prop("checked",true);
				$("#addServiceContentA").val("");
				$("#addServiceContentB").val("");
			}
		});
		
		return retObj;
	}

	
	
	function _orderGoods() {
		_ut.log("_orderGoods");

		if(_da.getData("selGoodsOptionItemList").length === 0) {
			alert("주문하실 상품을 선택하여 주세요.");
			return false;
		}
		
		for(var i = 0; i < _da.getData("selGoodsOptionItemList").length; i++) {
			var obj = _da.getData("selGoodsOptionItemList")[i];
			if(obj.itemState === "0" || obj.itemState === 0) {
				if(obj.totalStockCnt === "0" || obj.totalStockCnt === 0) {
					alert("품절상품은 주문할 수 없습니다.");
					return false;
				}
			}else{
				alert("품절상품은 주문할 수 없습니다.");
				return false;
			}
		}
		
		if(_da.getData("addServiceYn") === "Y") {
			if(_da.getData("addServiceContent") === "") {
				alert("부가서비스 내용을 입력하여 주세요.");
				return false;
			}else{
				_ut.log("addServiceType ==== ", _da.getData("addServiceType"));
				if(_da.getData("addServiceType") === "ADD_A") {
					_ut.log("addServiceContent.length === ", _da.getData("addServiceContent").length);
					if(_da.getData("addServiceContent").length > 10) {
						alert("10자 이내로 입력하시기 바랍니다.");
						return false;
					}
				}
			}
		}
		
			
			
			_orderGoodsProcess();
		
		
		
	}
	
	function _orderGoodsProcess() {
		_ut.log("_orderGoodsProcess");
		
		//인증체크가 일어난 이후, 주문이 실행되면 인증이 성공한 것
		if(_da.getData("authCheckYn") === "Y") _da.setData("authCheckSuccessYn","Y");
	
		
		var selGoodsOptionItemList = _.chain(_da.getData("selGoodsOptionItemList"))
		.filter(function(obj) { return obj.itemState === "0"})
		.map(function(obj) {
			var selObj = {};
			selObj.optionItemIdx = obj.optionItemIdx;
			selObj.goodsCnt = obj.selCnt;
			selObj.goodsNo = _da.getData("goods").goodsNo;
			if(_da.getData("addServiceYn") === "Y") {
				selObj.addServiceYn = "Y";
				selObj.addServiceContent = _da.getData("addServiceContent");
				selObj.addServiceType = _da.getData("addServiceType");
			}
			
			if(_da.getData("addServiceYn") === "N") {
				selObj.addServiceYn = "N";
				selObj.addServiceContent = "";
				selObj.addServiceType = "";
			}
			return selObj;
		}).value();

		_ut.log("selGoodsOptionItemList === ", selGoodsOptionItemList);
		
		$("#orderGoodsInfoListStr").val(JSON.stringify(selGoodsOptionItemList));

		$.ajax({			
			url: getContextPath()+"/ajax/cart/cartOrderAjax.do",
			data : {
				"sessionId" : getSessionId(),
				"orderGoodsInfoListStr" : $("#orderGoodsInfoListStr").val()
			},
		 	type: "post",
		 	async: false,
		 	cache: false,
		 	contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		 	error: function(request, status, error){
		 		didSubmit = false;	
		 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			},
			success: function(data){
				
				//goodsAggrSave('BASKET_CNT'); //집계테이블 장바구니담기 갯수 증가
				$("input[name=addServiceYnA][value='N']").prop("checked",true);
				$("input[name=addServiceYnB][value='N']").prop("checked",true);
				$("#addServiceContentA").val("");
				$("#addServiceContentB").val("");
			    
				if(data.result == true){
					var frm = document.orderForm;
					$("#sessionId").val(getSessionId());
					$("#redirectUrl").val(window.location.href);
					frm.action="/w/order/cartOrderProc.do";
					frm.submit();
				}else{
					if(data.msg != ""){
						didSubmit = false;	
						alert(data.msg);
					}
				}
			 }
		});
	}
	
	
	
	function _addWish() {
		_ut.log("_addWish");
		
		goodsAggrSave('WISH_CNT'); //집계테이블 찜하기 갯수 증가
		
		var selGoodsOptionItemList = [_da.getData("goods").goodsNo];

		_ut.log("selGoodsOptionItemList ===", selGoodsOptionItemList);
		
		
		var resultObj = addWishObject(selGoodsOptionItemList);
		_ut.log("_addWish : resultObj =", resultObj);
		
		if($(".btn-wishlist").length !== 0) {
			_.map($(".btn-wishlist"), function(obj) {
				if(!$(obj).hasClass("active")) $(obj).addClass("active");
			});
		}
	
	}
	
	function addCartDisplayInit() {
		_ut.log("addCartDisplayInit");
		var func = {};	
		func._addCart = _addCart;
		func._addRegularCart = _addRegularCart;
		func._addClubCart = _addClubCart;
		func._orderGoods = _orderGoods;
		func._addWish = _addWish;

		$("#addCartArea_A").append(_cv.getAddCartButtonRow(_da, func));
		$("#addCartArea_B").append(_cv.getAddCartButtonRow(_da, func));
	}
	
	
	function reviewInit() {
		$(document).ready(function(){
			_ut.log("reviewInit");
			reviewDataInit();
			reviewDisplayInit();
		});
	}
	
	
	function reviewDataInit() {
		_ut.log("reviewDataInit");
		
		// Ajax 호출 초기화
		var pa = _ut.getAjaxParam("POST", false, _da.getContext(), "요청하신 정보가 없습니다."); 
		pa.url = _da.getContext() + "/ajax/product/productReviewAjax.do";
		pa.data = { siteId: _da.getSiteId(), goodsNo: _da.getData("goods").goodsNo };

		
		// Ajax 호출
		var result = _ut.callAjax(pa, function(retObj){
			_ut.log("retObj : ",retObj);
			if(_.isObject(retObj)) {
				if(_.isArray(retObj.goodsReviewList)) { _da.setData("goodsReviewList", retObj.goodsReviewList); }
				if(_.isArray(retObj.goodsPhotoReviewList)) { _da.setData("goodsPhotoReviewList", retObj.goodsPhotoReviewList); }
				if(_.isArray(retObj.goodsReviewImgList)) { _da.setData("goodsReviewImgList", retObj.goodsReviewImgList); }
				if(_.isArray(retObj.goodsReviewReplyList)) { _da.setData("goodsReviewReplyList", retObj.goodsReviewReplyList); }
			}
		});
		
		_ut.log("reviewInit : DATA_LIST ====", _da.DATA_LIST);
	}
	
	function reviewDisplayInit() {
		_ut.log("reviewDisplayInit");
		
		var func = {};
		func._showPhotoReview = _showPhotoReview;
		func._showReview = _showReview;
		func._sortReviewList = _sortReviewList;

				
		$("#lstop").append(_cv.getReviewTitle(_da.getData("goodsReviewList"), _da, func))
		
		_sortReviewList("all","reviewHigh", 1);
	}
	
	
	
	function _sortReviewList(kindType, sortType, cPage) {
		_ut.log("_sortReviewList");
		_ut.log("kindType ===", kindType);
		_ut.log("sortType ===", sortType);
		_ut.log("cPage ===", cPage);
		
		_da.setData("kindType", kindType);
		_da.setData("sortType", sortType);
		_da.setData("cPage", cPage);
		
		var func = {};
		func._showPhotoReview = _showPhotoReview;
		func._showReview = _showReview;
		
		var kindList = [];
		
		if(kindType === "pet") kindList = _.where(_da.getData("goodsReviewList"), {petTypeIdx : _da.getData("petTypeIdx")});
		if(kindType === "all") kindList = _da.getData("goodsReviewList");
		
		var sortList = [];
		
		if(sortType === "reviewHigh") {
			sortList = kindList.sort(function(a, b) { 
				var rateA = (typeof a.rate === "string") ? parseInt(a.rate) : a.rate;
				rateA = -1 * rateA;
				var rateB = (typeof b.rate === "string") ? parseInt(b.rate) : b.rate;
				rateB = -1 * rateB;
				
				var regOrderDtA = (typeof a.regOrderDt === "string") ? parseInt(a.regOrderDt) : a.regOrderDt;
				regOrderDtA = -1 * regOrderDtA;
				var regOrderDtB = (typeof b.regOrderDt === "string") ? parseInt(b.regOrderDt) : b.regOrderDt;
				regOrderDtB = -1 * regOrderDtB;
				
				return rateA - rateB || regOrderDtA - regOrderDtB;
			});
		}
		
		if(sortType === "reviewLow") {
			sortList = kindList.sort(function(a, b) { 
				var rateA = (typeof a.rate === "string") ? parseInt(a.rate) : a.rate;
				var rateB = (typeof b.rate === "string") ? parseInt(b.rate) : b.rate;
				
				var regOrderDtA = (typeof a.regOrderDt === "string") ? parseInt(a.regOrderDt) : a.regOrderDt;
				regOrderDtA = -1 * regOrderDtA;
				var regOrderDtB = (typeof b.regOrderDt === "string") ? parseInt(b.regOrderDt) : b.regOrderDt;
				regOrderDtB = -1 * regOrderDtB;
				
				return rateA - rateB || regOrderDtA - regOrderDtB;
			});
			
		}
		
		if(sortType === "reviewNew") {
			sortList = _.sortBy(kindList, function(obj) { return obj.regDt }).reverse();
		}
		
		var pageObj = _ut.getPageObj(sortList, cPage, _da.getData("ROWCNT_PERPAGE"));
		
		
		_ut.log("page === ", pageObj);
		
		if(pageObj.data.length > 0) {
			$("#lscon").empty();
			$("#lscon").append(_cv.getReviewList(pageObj.data, _da, func));
			$("#lscon").append(_cv.getReviewPageRow(pageObj, _da));
			fn.ellipsis(".rviewlist .txt.ellipsis");
		}
	}

	
	function _showPhotoReview(reviewIdx) {
		_ut.log("_showPhotoReview");
		_ut.log("reviewIdx ===", reviewIdx);

		var idx = (typeof reviewIdx === "string")?parseInt(reviewIdx):reviewIdx;
		$("#photoReviewHeader").empty();
		$("#photoReviewContents").empty();
		var reviewObj = _.findWhere(_da.getData("goodsPhotoReviewList"), {reviewIdx: idx});
		_ut.log("_showPhotoReview : reviewObj === ", reviewObj);
		if(_.isObject(reviewObj)) {
			
			$("#photoReviewHeader").append(_cv.getPopupReviewHeader(reviewObj, _da));
			$("#photoReviewContents").append(_cv.getPopupReviewContents(reviewObj, _da));
			
			
			
				fn.popupOpen("#popDetailPhotoReview");
			
			
				
		}
	}
	
	function _showReview(reviewIdx) {
		_ut.log("_showReview");
		_ut.log("reviewIdx ===", reviewIdx);
		
		var idx = (typeof reviewIdx === "string")?parseInt(reviewIdx):reviewIdx;
		
		$("#reviewHeader").empty();
		$("#reviewcontents").empty();
		var reviewObj = _.findWhere(_da.getData("goodsReviewList"), {reviewIdx: idx});
		_ut.log("_showPhotoReview : reviewObj === ", reviewObj);
		if(_.isObject(reviewObj)) {
			$("#reviewHeader").append(_cv.getPopupReviewHeader(reviewObj, _da));
			$("#reviewcontents").append(_cv.getPopupReviewContents(reviewObj, _da));
			
			
			
			
				fn.popupOpen("#popDetailReview");
			
			
		}
	}
	

	function couponDownload() {
		_ut.log("couponDownload");
		
		
			if(confirm("로그인 후 이용 가능합니다. 로그인 하시겠습니까?")){
				location.href="/w/login/loginPage.do?refererYn=Y";
			}
			return false;
		
		
		_couponDataInit();
		_couponDisplayInit();
		
		fn.popupOpen('#popDetailCoupon');
	}
	
	function _couponDataInit() {
		_ut.log("_couponDataInit");
		// Ajax 호출 초기화
		var pa = _ut.getAjaxParam("POST", false, _da.getContext(), "요청하신 정보가 없습니다."); 
		pa.url = _da.getContext() + "/ajax/product/productCouponAjax.do";
		pa.data = { 
					siteId : _da.getSiteId(),
					goodsNo: _da.getData("goods").goodsNo,
					deviceType: "P",
					memberId: ""
				};
		
		// Ajax 호출
		var result = _ut.callAjax(pa, function(retObj){
			_da.setData("selCouponList", []);
			
			if(_.isArray(retObj.couponList)) {
				_ut.log("_couponDataInit : retObj ====", retObj);
				if(retObj.couponList.length > 0) {
					var couponList = _.filter(retObj.couponList, {isDownload: -1});
					_da.setData("couponList", couponList);
					_ut.log("couponList ===", _da.getData("couponList"));
				}
			}
		});
	}
	
	function _couponDownload(memberId, couponIdx, isDownload) {
		_ut.log("_couponDownload");
		_ut.log("memberId === "+memberId);
		_ut.log("couponIdx === " + couponIdx);
		_ut.log("isDownload === " + isDownload);
		
		var findObj = _.findWhere(_da.getData("selCouponList"), {memberId : memberId, couponIdx : couponIdx});
		if(_.isObject(findObj)) {
			alert("이미 선택하신 쿠폰입니다.");
			return false;
		}

		
		if(!_.isObject(findObj)) {
			var selCouponObj = {memberId : memberId, couponIdx : couponIdx};
			_da.getData("selCouponList").push(selCouponObj);
			_ut.log("selCouponList === ", _da.getData("selCouponList"));
		}
		
		var pa = _ut.getAjaxParam("POST", false, _da.getContext(), "요청하신 정보가 없습니다."); 
		pa.url = _da.getContext() + "/ajax/product/productCouponDownloadAjax.do";
		pa.data = { 
					siteId : _da.getSiteId(),
					couponIdx : couponIdx,
					memberId: memberId
				};
		
		// Ajax 호출
		var result = _ut.callAjax(pa, function(retObj){
			_ut.log("retObj ===", retObj);
			if(_.isObject(retObj)) {
				if(retObj.isSuccess === "Y") {
					$("#couponIdx_"+couponIdx).remove();
					if(_da.getData("selCouponList").length === _da.getData("couponList").length) {
						$("#couponList").append("<li>다운로드가능한 쿠폰이 없습니다.</li>");
					}
					alert("쿠폰이 다운로드되었습니다.");
				}
				
				if(retObj.isSuccess === "N") {
					if(_.isString(retObj.result)) {
						alert(retObj.result);
					}else{
						alert("쿠폰다운로드에 실패하였습니다.");
					}
				}
			}
		});
		
		
	}
	
	function _couponDisplayInit() {
		_ut.log("_couponDisplayInit");
		
		$("#couponList").empty();
		
		var func = {};
		func._couponDownload = _couponDownload;
		
		_.map(_da.getData("couponList"), function(obj) {
			_ut.log("_couponDisplayInit : obj ===",obj);
			$("#couponList").append(_cv.getCouponLi(obj, _da, func));
		});
		
		if(_da.getData("couponList").length === 0) {
			$("#couponList").append("<li>다운로드가능한 쿠폰이 없습니다.</li>");
		}
	
	}
	
	
	function btnInit() {
		_ut.log("btnInit");
		
		
		if (!_.isUndefined($("#addServiceA").attr("data-init"))){
			$("input[name=addServiceYnA]").change(function() {
				var addServiceYn = this.value;
				_da.setData("addServiceYn", addServiceYn);
				$("input[name=addServiceYnB][value='"+addServiceYn+"']").prop("checked",true);
				
				if(addServiceYn === "Y") {
					$("#addServiceContentA").attr("disabled", false);
					$("#addServiceContentB").attr("disabled", false);
				}
				
				if(addServiceYn === "N") {
					$("#addServiceContentA").val("");
					$("#addServiceContentB").val("");
					$("#addServiceContentA").attr("disabled", true);
					$("#addServiceContentB").attr("disabled", true);
				}
				
				if(_da.getData("selGoodsOptionItemList").length > 0) {
					_setTotalPrice();
				}
			});
			
			$("#addServiceContentA").change(function() {
				var addServiceContent = this.value;
				$("#addServiceContentB").val(addServiceContent);
				_ut.log("addServiceContentA ===", addServiceContent);
				_da.setData("addServiceContent", addServiceContent);
			});
		}
		
		if (!_.isUndefined($("#addServiceB").attr("data-init"))){
			$("input[name=addServiceYnB]").change(function() {
				var addServiceYn = this.value;
				_da.setData("addServiceYn", addServiceYn);
				$("input[name=addServiceYnA][value='"+addServiceYn+"']").prop("checked",true);
				
				if(addServiceYn === "Y") {
					$("#addServiceContentA").attr("disabled", false);
					$("#addServiceContentB").attr("disabled", false);
				}
				
				if(addServiceYn === "N") {
					$("#addServiceContentA").val("");
					$("#addServiceContentB").val("");
					$("#addServiceContentA").attr("disabled", true);
					$("#addServiceContentB").attr("disabled", true);
				}
				
				
				
				if(_da.getData("selGoodsOptionItemList").length > 0) {
					_setTotalPrice();
				}
			});
			
			$("#addServiceContentB").change(function() {
				var addServiceContent = this.value;
				$("#addServiceContentA").val(addServiceContent);
				_ut.log("addServiceContentB ===", addServiceContent);
				_da.setData("addServiceContent", addServiceContent);
			});
		}
		
		//재입고알람 확인 버튼
		$("#restockAlarm_confirmBtn").click(function() {
			_ut.log("restockAlarm_confirmBtn");
			_confirmRestockAlarm();
		});
		
		for(var i = 2; i <= 5; i++) {
			$("#cateLocation"+i).change(function() {
				goCateLocation(this.value);
			});
		}

	}
	
	
	function goCateLocation(cateIdx) {
		if(!$.isNumeric(cateIdx)) return false;
		
		_ut.log("goCateLocation : cateIdx = ", cateIdx);
		
		var pa = _ut.getAjaxParam("POST", false, _da.getContext(), "요청하신 정보가 없습니다."); 
		pa.url = _da.getContext() + "/ajax/product/productCateLocationAjax.do";
		pa.data = { 
					siteId : _da.getSiteId(),
					cateIdx : cateIdx
				};
		
		// Ajax 호출
		var result = _ut.callAjax(pa, function(retObj){
			_ut.log("retObj ===", retObj);
			if(_.isObject(retObj) && _.isObject(retObj.cateLocation)) {
				var cateLocationObj = retObj.cateLocation;
				if(_.isString(cateLocationObj.pathIdx) && cateLocationObj.pathIdx !== "" && cateLocationObj.pathIdx !== "#") {
					var pathIdxArr = cateLocationObj.pathIdx.split(":");
					_ut.log("pathIdxArr ==== ", pathIdxArr);
					var queryString = "";
					for(var i = 1; i < pathIdxArr.length; i++) {
						if(i === 1) queryString = queryString + "?schCateIdx" + i + "=" + pathIdxArr[i];
						if(i !== 1) queryString = queryString + "&schCateIdx" + i + "=" + pathIdxArr[i];
					}

					location.href = "/w/product/productList.do" + queryString;
				}
			}
		});
		
	}
	
	function goodsAggrSave(type) {
		if(_.isUndefined(type) || !_.isString(type)) return false;
		_ut.log("goodsAggrSave : type ==== ", type);
		
		var pa = _ut.getAjaxParam("POST", false, _da.getContext(), "요청하신 정보가 없습니다."); 
		pa.url = _da.getContext() + "/ajax/product/productGoodsAggrSaveAjax.do";
		pa.data = { 
					siteId : _da.getSiteId(),
					goodsNo : _da.getData("goods").goodsNo,
					type: type
				};
		
		// Ajax 호출
		var result = _ut.callAjax(pa, function(retObj){
			_ut.log("retObj ===", retObj);
			if(_.isObject(retObj)) {
				if(retObj.isSuccess === "Y") {
					_ut.log("goodsAggrSave("+type+") Call Success");
				}
			}
		});
		
	}
	
	
	// SNS 공유
	function snsShare(snsType){
		// F : 페이스북, K : 카카오스토리
		var nowPage = document.location.href;
		var title = "FX 153 리미티드 에디션";
	 	var size = 'width=550 height=550';
		var url = "";
		
		if(snsType == "F"){
			url = '//www.facebook.com/sharer/sharer.php?u='+nowPage+'&t='+title;
		}else if(snsType == "K"){
			url = 'https://story.kakao.com/share?url='+encodeURIComponent(nowPage);
		}
		window.open(url,'_blank', size);  
	}

	// URL 공유
	function urlShare(){
		var nowPage = document.location.href;
		var isIe = !!document.documentMode;
		if(isIe) {
			window.clipboardData.setData('Text', nowPage);
		    alert('클립보드에 복사가 되었습니다. \n\n\'Ctrl+V를 눌러 붙여넣기 해주세요.');
		} else {
			prompt('아래 주소를 복사 해주세요', nowPage);
		}
	}
	

</script>
<script type="text/javascript" charset="utf-8" src="https://pay.naver.com/button/info?callback=naver.NaverPayButton.jsonp.callback&amp;buttonKey=A7D2B184-FA4F-4BF9-9EB6-F6657B908300&amp;buttonTypeCode=C_1_2_Y&amp;site_preference=normal"></script></head>





<body>

	<main id="contents" class="goods detail"> <!-- location// -->
	<div class="inner location">
		<ul>
			<li><a href="<%=cp%>/monnami/main/main.do">Home</a></li>
			<li><a href="<%=cp%>/monnami/product/main.do">Stationery</a></li>
			<li><select id="cateLocation2">
					<option value="221" selected="selected">기록의 시작</option>
					<option value="225">취미의 발견</option>
					<option value="232">상상과 표현</option>
					<option value="234">프로들의 도구</option>
					<option value="463">생활 속 문구</option>
			</select>
			<div class="dropdown" tabindex="0">
					<span class="current">기록의 시작</span>
					<div class="list" style="width: 87.7656px;">
						<ul>
							<li class="option selected" data-value="221" data-display-text="">기록의
								시작</li>
							<li class="option " data-value="225" data-display-text="">취미의
								발견</li>
							<li class="option " data-value="232" data-display-text="">상상과
								표현</li>
							<li class="option " data-value="234" data-display-text="">프로들의
								도구</li>
							<li class="option " data-value="463" data-display-text="">생활
								속 문구</li>
						</ul>
					</div>
				</div></li>
			<li><select id="cateLocation3">
					<option value="222">필기용</option>
					<option value="223" selected="selected">메모용</option>
					<option value="224">글자강조(Highlighting)</option>
					<option value="485">고급필기류</option>
					<option value="487">리필</option>
			</select>
			<div class="dropdown" tabindex="0">
					<span class="current">메모용</span>
					<div class="list" style="width: 130.422px;">
						<ul>
							<li class="option " data-value="222" data-display-text="">필기용</li>
							<li class="option selected" data-value="223" data-display-text="">메모용</li>
							<li class="option " data-value="224" data-display-text="">글자강조(Highlighting)</li>
							<li class="option " data-value="485" data-display-text="">고급필기류</li>
							<li class="option " data-value="487" data-display-text="">리필</li>
						</ul>
					</div>
				</div></li>
		</ul>
	</div>
	<!-- //location --> <!-- product// -->

	<div class="inner product">
		<!-- propic// -->
		<div class="propic" style="top: 150px; position: absolute;">
			<div class="bpic">
				<div class="zoomWrapper" style="height: 540px; width: 540px;">
					<img src="<%=cp%>/monnami/content/images/${dto2.productSub2_saveFileName }" name="img1" class="loading"">
				</div>
			</div>
			<div class="spic">
				<div id="swiperFirst">
					<div class="swiper_wrapper">
						<div class="swiper-slide swiper-slide-active" style="width: 300px; margin-right: 10px; float: none;">
							<img src="<%=cp%>/monnami/content/images/${dto2.productSub2_saveFileName }" 	
							style="cursor:hand;" onmouseover="fimg('<%=cp%>/monnami/content/images/${dto2.productSub2_saveFileName }')"/>
							<img src="<%=cp%>/monnami/content/images/${dto2.productSub2_saveFileNameSub }" 	
							style="cursor:hand;" alt="<%=cp%>/monnami/images/common/heart.png" onmouseover="fimg('<%=cp%>/monnami/content/images/${dto2.productSub2_saveFileNameSub }')"/>
						</div>
					</div>
				</div>
				<div class="swiper-button-next-spic swiper-button-disabled">next</div>
				<div class="swiper-button-prev-spic swiper-button-disabled">prev</div>
			</div>
		</div>
		
		<!-- //propic -->

		<!-- proinfo// -->
		<div class="proinfo">
			<h2>
				<strong>${dto.product_name }</strong>
			</h2>

			<ul class="share">
				<li><a href="javascript:void(0);" class="btn-facebook"
					onclick="snsShare('F');">facebook</a></li>
				<li><a href="javascript:void(0);" class="btn-kakaostory"
					onclick="snsShare('K');">카카오스토리</a></li>
				<li><a href="javascript:void(0);" class="btn-url"
					onclick="urlShare();">URL</a></li>
			</ul>

			<div class="pinfo-txt">
				<table>
					<caption>상품주요정보</caption>
					<colgroup>
						<col style="width: 120px">
						<col>
					</colgroup>

				<tbody class="pinfo-txt">
					<tr class="info-color">
						<th>잉크컬러</th>
							<td>
								<ul>
									<c:if test="${'black' eq dto.productSub_color4}">
									<li><img	
										src="<%=cp%>/monnami/images/color/black.png"
										alt="" class="loading" data-was-processed="true" width="30" height="30"><span>블랙</span>
									</li>
									</c:if>
									
									<c:if test="${'red' eq dto.productSub_color1}">
									<li><img
										src="<%=cp%>/monnami/images/color/red.png"
										alt="" class="loading" data-was-processed="true" width="30" height="30"><span>레드</span>
									</li>
									</c:if>
									
									<c:if test="${'green' eq dto.productSub_color3}">
									<li><img
										src="<%=cp%>/monnami/images/color/green.png"
										alt="" class="loading" data-was-processed="true" width="30" height="30"><span>그린</span>
									</li>
									</c:if>
									
									<c:if test="${'blue' eq dto.productSub_color5}">
									<li><img
										src="<%=cp%>/monnami/images/color/blue.png"
										alt="" class="loading" data-was-processed="true" width="30" height="30"><span>블루</span>
									</li>
									</c:if>
									
									<c:if test="${'yellow' eq dto.productSub_color2}">
									<li><img
										src="<%=cp%>/monnami/images/color/yellow.png"
										alt="" class="loading" data-was-processed="true" width="30" height="30"><span>옐로</span>
									</li>
									</c:if>
									
									
									
								</ul>
							</td>
					</tr>


					<tr class="info-weight">
						<th>심두께및스펙</th>
							<td>
								<ul>
									<li><img
										src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/attribute/24_58562_P_120x80.blob"
										alt="" class="loading" data-was-processed="true">0.7mm</li>
								</ul>
							</td>
					</tr>


					<tr>
						<th>주요특징</th>
							<td>3.1운동 100주년 기념 한정판</td>
					</tr>

					<tr class="info-spec">
						<th>주요특징</th>
						<td><span>유성펜</span><span>153시리즈</span><span>중간굵기필기용</span><span>부드러운필기감</span><span>깔끔한필기감</span>
						</td>

					</tr>

				</tbody>

				<tbody class="pinfo-price">
					<tr>
						<th>판매가</th>
						<td><span class="txt-price"><em>${dto.product_cost}</em>원</span></td>
					</tr>

					<tr>
						<th>회원혜택</th>
						<td>회원등급별 포인트 적립 및 즉시할인
							<button type="button" class="btn-white small"	onclick="fn.popupOpen('#popDetailBenefits');">회원별 혜택 +</button>
						</td>
					</tr>

					<tr>
						<th>카드혜택</th>
						<td>3월 카드사 무이자 할부
						<button type="button" class="btn-white small"	onclick="fn.popupOpen('#popInstallment');">카드사 혜택 +</button>
						</td>
					</tr>


				</tbody>
					
				<tbody class="pinfo-info">
					<tr>
						<th>원산지/판매원</th>
						<td>(주)모나미</td>
					</tr>
					<tr>
						<th>배송정보</th>
						<td>16시 30분 이전 주문시 당일출고(공휴일,토/일요일제외)</td>
					</tr>
					<tr>
						<th>배송비<a href="#" class="btn-popinfo type-over">!</a>
						</th>
						<td>2,500원 (3만원 이상주문시 무료 배송)</td>
					</tr>
				</tbody>
				</table>
			</div>

			<fieldset>
				<legend class="hide">상품옵션선택</legend>
				<div class="pro-select">
					<ul id="optionArea_A"></ul>
				</div>
				<div class="pro-option" id="selOption_A">

					<div id="goodsOptionItemDiv_A_43136">
						<strong>FX 153 리미티드 에디션(재고:383개)</strong>
						<div class="ea-area">
							<input readonly="" title="수량입력" value="1" id="selCnt_A_43136">
							<button type="button" class="btn-down">수량 낮추기</button>
							<button type="button" class="btn-up">수량 올리기</button>
						</div>
						<em id="selPrice_A_43136">6,000원</em>
					</div>
				</div>

				<div class="pro-total">
					<strong>총 상품금액</strong> <em id="totalPrice_A">6,000</em>원
				</div>

				<div class="pro-club" id="addCartArea_A">

					<label><input type="checkbox" class="small club"><span>클럽
							장바구니 담기</span></label>
				</div>

				<!-- default// -->
				<div class="btn-area btnarea-default active">
					<button type="button" class="btn-gray btn-cart"
						onclick="_addCart();">장바구니 담기</button>
					<button type="button" class="btn-black btn-buy"
						onclick="_orderGoods();">바로 구매하기</button>
					<button type="button" class="btn-white btn-wishlist btn-wish"
						data-goodsno="MG000003580">찜</button>
				</div>
				<!-- //default -->
				<!-- 정기배송담기// -->

				<div class="btn-area btnarea-regular">

					<button type="button" class="btn-black btn-buy"
						onclick="_orderGoods();">바로 구매하기</button>
					<button type="button" class="btn-white btn-wishlist btn-wish"
						data-goodsno="MG000003580">찜</button>
				</div>
				<!-- //정기배송담기 -->
				<!-- 클럽 장바구니 담기// -->
				<div class="btn-area btnarea-club">
					<button type="button" class="btn-gray btn-cart"
						onclick="_addClubCart();">클럽 장바구니 담기</button>
					<button type="button" class="btn-black btn-buy"
						onclick="_orderGoods();">바로 구매하기</button>
					<button type="button" class="btn-white btn-wishlist btn-wish"
						data-goodsno="MG000003580">찜</button>
				</div>
				<!-- //클럽 장바구니 담기 -->
				
			

			</fieldset>

		</div>
		<!-- //proinfo -->
	</div>
	<!-- //product --> <!-- pdetail// -->
	<div class="inner pdetail">
		<!-- 탭타이틀 -->
		<div class="tabs tabs4"
			style="position: absolute; top: 0px; left: 0px; transform: translateX(0px);">
			<ul>
				<li class="m-review active"><a href="#reView">상품리뷰</a></li>
				<li class="m-review active"><a href="#reView">&nbsp;</a></li>
				<li class="m-review active"><a href="#reView">&nbsp;</a></li>
				<li class="m-review active"><a href="#reView">&nbsp;</a></li>
			</ul>
		</div>




		<!-- 이지웰일경우 스토리픽 미노출 -->



		<script>
			reviewInit();
		</script>
		<div id="reView" class="review">
			<div class="rviewcon">
				<h3 class="sti">상품리뷰</h3>
				<div class="grade">
					<table align="left">
						<tr >
							<td colspan="3">
							<textarea class="review" rows="2" cols="110">
							
							
							
							</textarea>
							</td>
							
							<td>
							<input type="button" class="btn-white" value="등록하기">
							</td>
						</tr>
						
						<tr>
							<td colspan="3" height="10">
							나오니
							
							</td>
							<td>
								${member_id }
							</td>
						
						</tr>
						

					</table>
					<div>
					</div>
				
				</div>
			</div>
			<div class="rviewlist">
				<div class="lscon">
					<div class="nodata">작성된 상품 리뷰가 없습니다.</div>
				</div>
			</div>
		</div>









		<!-- 이지웰일경우 스토리픽 미노출 -->



		<div id="storyPick" class="storypick">
			<h3 class="hide">스토리픽</h3>
			<div class="nodata">등록된 연관 스토리픽이 없습니다.</div>
		</div>











		<!-- 이지웰일경우 스토리픽 미노출 -->










		<!-- 이지웰일경우 스토리픽 미노출 -->








		<div id="detailInfo" class="detailinfo">
			<h3 class="hide">상품상세정보</h3>
			<div class="info-txt">
				<ul>
				</ul>
			</div>
			<div class="info-pic">
				<p style="text-align: center;">
					<img alt=""
						src="<%=cp%>/monnami/content/images/${dto2.productSub2_saveFileNameContent }"
						style="width: 1100px; height: 5523px;" class="loading"
						data-was-processed="true">
				</p>
			</div>
		</div>
		<div class="prd-infonotice">
			<h3>상품정보고시</h3>

			<table>
				<caption>상품정보고시</caption>
				<colgroup>
					<col style="width: 50%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>항목</th>
						<th>내용</th>
					</tr>
					<tr>
						<td>품명 및 모델명</td>
						<td>상품상세설명 참조</td>
					</tr>
					<tr>
						<td>제조자/수입품의 경우 수입자를 함께 표기</td>
						<td>상품상세설명 참조</td>
					</tr>
					<tr>
						<td>법에 의한 인증, 허가 등을 받았음을 확인할 수 있는 경우 그에 대한 사항</td>
						<td>상품상세설명 참조</td>
					</tr>
					<tr>
						<td>제조국 또는 원산지</td>
						<td>상품상세설명 참조</td>
					</tr>
					<tr>
						<td>A/S책임자와 전화번호 또는 소비자 상담 관련 전화번호</td>
						<td>모나미몰 고객센터 1544-2884</td>
					</tr>
				</tbody>
			</table>
		</div>





		<!-- 이지웰일경우 스토리픽 미노출 -->


		<!-- 반품교환 안내// -->
		<div class="returninfo" id="returnInfo">
			<h3 class="hide">&nbsp;</h3>

			<table>
				<caption>&nbsp;</caption>
				<colgroup>
					<col style="width: 185px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>배송정보</th>
						<td>-모나미 물류배송의 경우 :&nbsp;실 결제금액(예치금 포함) 3만원 이상일 경우
							무료배송입니다.&nbsp;무료배송 상품이 포함됐을 경우 해당 상품은 구매금액&nbsp;합산에서 제외됩니다.&nbsp;<br>
							-업체직배송 상품 중 무료배송이 아닌 경우 : 업체개별 배송비 정책에 따라 배송비가 개별 부과됩니다.&nbsp;<br>
							-배송비 정책 제외 상품의 경우(개별배송비 부과) : 배송비 정책과는 무관하게 상품에 부과되는 배송비로 배송정책
							비용에 비포함되며, 수량*배송비가 부과됩니다. 배송비 정책 제외 대상 상품은 무료배송 조건 합산금액에는 포함되지
							않습니다.&nbsp;<br> -도서산간비 : 3만원 미만 구매 시 기본 배송료 2,500원에 추가 도선료가
							부과됩니다. 3만원 이상 구매 시에는 기본 배송료가 무료이므로 추가 도선료만 부과됩니다. 도서산간비의 경우, 모나미
							물류배송, 업체직배송 모두 기준 공통으로 적용합니다.&nbsp;
						</td>
					</tr>
					<tr>
						<th>주문취소</th>
						<td>-주문 상태가 ‘입금대기’, '결제완료' 일 경우는 모나미몰 마이페이지에서 신청하실 수 있습니다.<br>
							-주문 상품의 상태가 ‘배송준비중’, ‘배송중’, ‘배송완료’인 경우는 주문 취소 신청이 진행이 되지 않으며, 반품,
							교환으로 진행한 뒤 제품 회수 후 환불 처리됩니다. 환불 처리는 제품 회수 완료 시점으로 최대 15일 이내에 처리해
							드립니다.&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<th>교환안내</th>
						<td>교환은 ‘배송중’, '배송완료'의 상태일 때 신청이 가능하며 모나미몰 마이페이지에서 신청하실 수
							있습니다. 교환신청 후 교환을 원하는 상품을 먼저 모나미몰, 또는 판매자에게 발송하고 모나미몰 또는 판매자가 상품
							확인 후 교환 상품 발송이 이루어집니다.</td>
					</tr>
					<tr>
						<th>반품안내</th>
						<td>반품 교환 시점은 제품 수령일로부터 7일 이내 가능하며 수령 받은 상태로 제품이 선회수되어야 합니다.
							상품 확인 후 환불이 진행됩니다.&nbsp;고객님의 단순변심으로 인한 반품의 경우, 결제금액(실제 결제한 금액)에서
							배송비를 차감한 뒤 환불됨을 알려드립니다.&nbsp;</td>
					</tr>
					<tr>
						<th>교환/반품 배송비 안내</th>
						<td>결제수단에 따라 처리 기간의 차이가 날 수 있으며, 모나미몰의 경우, 토/일요일, 공휴일 제외 5~7일
							정도 소요됨을 알려드립니다. 판매자 상품의 경우, 모나미몰 소요기간과 다를 수 있음을 알려드립니다.&nbsp;
							&nbsp;</td>
					</tr>
					<tr>
						<th>반품/교환 불가사유 안내</th>
						<td>- 제품 하자, 오배송의 이유로 반품, 교환 시에는 모나미몰 또는 판매자가 배송비를 부담합니다. 단,
							모나미몰 또는 판매자가 반품상품 확인 후 상품불량이 아닌 것으로 판명 시 반송비(왕복 배송비, 무료배송인 경우에도
							왕복 배송비 부과)를 고객님께 부과할 수 있습니다.<br> - 단순변심, 고객님의 개인적인 사정으로 인해
							교환 및 반품을 진행하실 경우에는 결제금액(실제 결제금액)에서 배송비를 차감한 뒤 환불됨을 알려드립니다.
						</td>
					</tr>
					<tr>
						<th>취소/반품/환불 소요기간 안내</th>
						<td>반품, 교환 가능 기능을 초과하였을 경우, 고객님 책임에 해당하는 사유로 상품 및 구성품 등이
							멸실훼손된 경우(개봉된 제품), 고객님 사용 또는 일부 소비에 의해 상품 가치가 감소한 경우, 상품 제작에 들어가는
							각인 서비스의 경우, 그 외 전자상거래 등에서 소비자보호에 관한 법률이 정하는 청약철회 제한에 해당하는 경우입니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- //반품교환 안내 -->










	


	</div>
	<!-- //pdetail --> <!-- bottombuybtn// -->
	<div class="bottombuybtn" style="bottom: -111px;">
		<div class="inner">
			<div class="boptionarea">
				<div class="pro-select">
					<ul id="optionArea_B">

					</ul>
				</div>
				<div class="pro-club">




					<label><input type="checkbox" class="small club"><span>클럽
							장바구니 담기</span></label>


				</div>

				<div class="pro-option" id="selOption_B">
					<div id="goodsOptionItemDiv_B_43136">
						<strong>FX 153 리미티드 에디션(재고:383개)</strong>
						<div class="ea-area">
							<input readonly="" title="수량입력" value="1" id="selCnt_B_43136">
							<button type="button" class="btn-down">수량 낮추기</button>
							<button type="button" class="btn-up">수량 올리기</button>
						</div>
						<em id="selPrice_B_43136">6,000원</em>
					</div>
				</div>
			</div>
			<div class="bbuybtn" id="addCartArea_B">
				<span class="txt-option">선택 옵션 <strong><em
						id="totalSelCnt_B">1</em> 건</strong></span> <span class="txt-total">총 상품금액
					<strong><em id="totalPrice_B">6,000</em>원</strong>
				</span>

				<!-- default// -->
				<div class="btn-area btnarea-default active">
					<button type="button" class="btn-gray btn-cart"
						onclick="_addCart();">장바구니 담기</button>
					<button type="button" class="btn-black btn-buy"
						onclick="_orderGoods();">바로 구매하기</button>

					<button type="button" class="btn-white btn-wishlist btn-wish"
						data-goodsno="MG000003580">찜</button>

				</div>
				<!-- //default -->
				<!-- 정기배송담기// -->
				<div class="btn-area btnarea-regular">



					<button type="button" class="btn-black btn-buy"
						onclick="_orderGoods();">바로 구매하기</button>


					<button type="button" class="btn-white btn-wishlist btn-wish"
						data-goodsno="MG000003580">찜</button>

				</div>
				<!-- //정기배송담기 -->
				<!-- 클럽 장바구니 담기// -->
				<div class="btn-area btnarea-club">

					<button type="button" class="btn-gray btn-cart"
						onclick="_addClubCart();">클럽 장바구니 담기</button>

					<button type="button" class="btn-black btn-buy"
						onclick="_orderGoods();">바로 구매하기</button>


					<button type="button" class="btn-white btn-wishlist btn-wish"
						data-goodsno="MG000003580">찜</button>

				</div>
				<!-- //클럽 장바구니 담기 -->



			</div>
			<button type="button" class="btn-white btn-option">옵션선택</button>
		</div>
	</div>
	<!-- //bottombuybtn --> </main>



</body>
</html>