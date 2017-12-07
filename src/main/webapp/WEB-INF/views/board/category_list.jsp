<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Study Room Category</title>
<style type="text/css">
body{
	padding: 25px;
}

h1 {
  color: black;
  text-shadow: #99FFCC 0px 0px 10px; /* for browsers without spread support */
  text-shadow: #99FFCC 0px 0px 10px 10px; /* for browsers with spread support */
}

h3 { 
  color: black; 
  text-shadow: 1px 3px 3px rgba(135, 206, 235, 1); 
}
</style>
<script type="text/javascript">
window.onload=function(){
// 	var parentDoc= window.parent.document;
// 	var ifrm = $(parentDoc).find('#the_iframe');
	
// 	var board_height = $(document).height();
	
// 	ifrm.attr('onload', "resizeFrame(this,'"+board_height+"px')");
// 	parent.resizeFrame(ifrm, board_height);
};
</script>
</head>
<body>
<h1>쉽게 메모하세요. 그리고 공유하세요.</h1>

<div>
	<h3>
		▼ IT
	</h3>
	<p>
		<a href="boardSearch.do?searchOption=category&category=JAVA">▶JAVA</a>
		<a href="boardSearch.do?searchOption=category&category=JavaScript">▶JavaScript</a>
		<a href="boardSearch.do?searchOption=category&category=CSS">▶CSS</a>
		<a href="boardSearch.do?searchOption=category&category=JSP">▶JSP</a>
		<a href="boardSearch.do?searchOption=category&category=Spring">▶Spring</a>
		<a href="boardSearch.do?searchOption=category&category=Database">▶Database</a>
		<a href="boardSearch.do?searchOption=category&category=Android">▶Android</a> 
	</p>
	<p>
	<h3>
		▼ English
	</h3>
	<p>
		<a href="boardSearch.do?searchOption=category&category=SONG">▶SONG</a>
		<a href="boardSearch.do?searchOption=category&category=구어체">▶구어체</a>
		<a href="boardSearch.do?searchOption=category&category=MEMO">▶MEMO</a>
	</p>
	<p></p>
	<h3>
		▼ ETC
	</h3>
	<p>
		<a href="boardSearch.do?searchOption=category&category=ETC">▶ETC</a>
	</p>
</div>

</body>
</html>