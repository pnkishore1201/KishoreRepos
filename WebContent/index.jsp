<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="jquery-ui.min.css">
<script src="external/jquery/jquery.js"></script>
<script src="jquery-ui.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Store Front</title>
</head>

<script src="http://code.jquery.com/jquery-1.7.js" 
            type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
   /*  var data = [["City 1", "City 2", "City 3"], //headers
                ["New York", "LA", "Seattle"], 
                ["Paris", "Milan", "Rome"], 
                ["Pittsburg", "Wichita", "Boise"]] */
    //var cityTable = makeTable($(document.body), data);
    
    $("#counterQueue").hide();
    
    $("#addCounter").click(function () {
    	 $("#counterQueue").show();
    });
    
    $("#submitAction").click(function () {
    	var counterName = $("#counterName").val();
    	var counterId = $("#counterId").val();
    	
    	var value = JSON.Stringfy({"counterName":counterName,"counterId":counterId});
    	$.ajax({
    	  type: "POST",
    	  url: "http://localhost:8081/hack33",
    	  data: value,
    	  cache: false,
    	  success: function(data){
    		   ($(document.body), data);
    	  }
    	});
    	
   	 
   });
    
});
    
    function makeTable(container, data) {
        var table = $("<table/>").addClass('CSSTableGenerator');
        $.each(data, function(rowIndex, r) {
            var row = $("<tr/>");
            $.each(r, function(colIndex, c) { 
                row.append($("<t"+(rowIndex == 0 ?  "h" : "d")+"/>").text(c));
            });
            table.append(row);
        });
        return container.append(table);
    }
    
    function showCounteQueue(container, data) {
        var table = $("<table/>").addClass('CSSTableGenerator');
        $.each(data, function(rowIndex, r) {
            var row = $("<tr/>");
            $.each(r, function(colIndex, c) { 
                row.append($("<t"+(rowIndex == 0 ?  "h" : "d")+"/>").text(c));
            });
            table.append(row);
        });
        return container.append(table);
    }
    
    
</script>

<body>
	<h1>Store Front</h1>
	<form action="store_action" method="post">
		<table style="with: 50%">
			<tr>
				<td>Add Counter</td>
				<td><input type="button" name="first_name" id="addCounter" value="Add Counter"/></td>
			</tr>

		</table>
		<div id="counterQueue">
		<table >
			<tr>
				<td>Counter Name :</td>
				<td><input type="text" name="first_name" id="counterName" value=""/></td> 
				
			</tr>
			<tr>
				<td>Counter ID :</td>
				<td><input type="text" name="first_name" id="counterId" value=""/></td> 
				
			</tr>
		</table>
		</div>
		<input type="submit" value="Submit" id="submitAction" />

	</form>
</body>
</html>