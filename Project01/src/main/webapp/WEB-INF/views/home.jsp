<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
<!-- Original:  Nick Korosi (nfk2000@hotmail.com) -->

<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com -->

//<!-Begin
var dDate = new Date();
var dCurMonth = dDate.getMonth();
var dCurDayOfMonth = dDate.getDate();
var dCurYear = dDate.getFullYear();
var objPrevElement = new Object();

function fToggleColor(myElement) {
var toggleColor = "#ff0000";
if (myElement.id == "calDateText") {
if (myElement.color == toggleColor) {
myElement.color = "";
} else {
myElement.color = toggleColor;
   }
} else if (myElement.id == "calCell") {
for (var i in myElement.children) {
if (myElement.children[i].id == "calDateText") {
if (myElement.children[i].color == toggleColor) {
myElement.children[i].color = "";
} else {
myElement.children[i].color = toggleColor;
            }
         }
      }
   }
}
function fSetSelectedDay(myElement){
if (myElement.id == "calCell") {
if (!isNaN(parseInt(myElement.children["calDateText"].innerText))) {
myElement.bgColor = "#c0c0c0";
objPrevElement.bgColor = "";
document.all.calSelectedDate.value = parseInt(myElement.children["calDateText"].innerText);
objPrevElement = myElement;
      }
   }
}
function fGetDaysInMonth(iMonth, iYear) {
var dPrevDate = new Date(iYear, iMonth, 0);
return dPrevDate.getDate();
}
function fBuildCal(iYear, iMonth, iDayStyle) {
var aMonth = new Array();
aMonth[0] = new Array(7);
aMonth[1] = new Array(7);
aMonth[2] = new Array(7);
aMonth[3] = new Array(7);
aMonth[4] = new Array(7);
aMonth[5] = new Array(7);
aMonth[6] = new Array(7);
var dCalDate = new Date(iYear, iMonth-1, 1);
var iDayOfFirst = dCalDate.getDay();
var iDaysInMonth = fGetDaysInMonth(iMonth, iYear);
var iVarDate = 1;
var i, d, w;
if (iDayStyle == 2) {
aMonth[0][0] = "Sunday";
aMonth[0][1] = "Monday";
aMonth[0][2] = "Tuesday";
aMonth[0][3] = "Wednesday";
aMonth[0][4] = "Thursday";
aMonth[0][5] = "Friday";
aMonth[0][6] = "Saturday";
} else if (iDayStyle == 1) {
aMonth[0][0] = "Sun";
aMonth[0][1] = "Mon";
aMonth[0][2] = "Tue";
aMonth[0][3] = "Wed";
aMonth[0][4] = "Thu";
aMonth[0][5] = "Fri";
aMonth[0][6] = "Sat";
} else {
aMonth[0][0] = "Su";
aMonth[0][1] = "Mo";
aMonth[0][2] = "Tu";
aMonth[0][3] = "We";
aMonth[0][4] = "Th";
aMonth[0][5] = "Fr";
aMonth[0][6] = "Sa";
}
for (d = iDayOfFirst; d < 7; d++) {
aMonth[1][d] = iVarDate;
iVarDate++;
}
for (w = 2; w < 7; w++) {
for (d = 0; d < 7; d++) {
if (iVarDate <= iDaysInMonth) {
aMonth[w][d] = iVarDate;
iVarDate++;
      }
   }
}
return aMonth;
}
function fDrawCal(iYear, iMonth, iCellWidth, iCellHeight, sDateTextSize, sDateTextWeight, iDayStyle) {
var myMonth;
myMonth = fBuildCal(iYear, iMonth, iDayStyle);
document.write("<table border='1'>")
document.write("<tr>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][0] + "</td>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][1] + "</td>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][2] + "</td>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][3] + "</td>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][4] + "</td>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][5] + "</td>");
document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][6] + "</td>");
document.write("</tr>");
for (w = 1; w < 7; w++) {
document.write("<tr>")
for (d = 0; d < 7; d++) {
document.write("<td align='left' valign='top' width='" + iCellWidth + "' height='" + iCellHeight + "' id=calCell style='CURSOR:Hand' onMouseOver='fToggleColor(this)' onMouseOut='fToggleColor(this)' onclick=fSetSelectedDay(this)>");
if (!isNaN(myMonth[w][d])) {
document.write("<font id=calDateText onMouseOver='fToggleColor(this)' style='CURSOR:Hand;FONT-FAMILY:Arial;FONT-SIZE:" + sDateTextSize + ";FONT-WEIGHT:" + sDateTextWeight + "' onMouseOut='fToggleColor(this)' onclick=fSetSelectedDay(this)>" + myMonth[w][d] + "</font>");
} else {
document.write("<font id=calDateText onMouseOver='fToggleColor(this)' style='CURSOR:Hand;FONT-FAMILY:Arial;FONT-SIZE:" + sDateTextSize + ";FONT-WEIGHT:" + sDateTextWeight + "' onMouseOut='fToggleColor(this)' onclick=fSetSelectedDay(this)> </font>");
}
document.write("</td>")
}
document.write("</tr>");
}
document.write("</table>")
}
function fUpdateCal(iYear, iMonth) {
myMonth = fBuildCal(iYear, iMonth);
objPrevElement.bgColor = "";
document.all.calSelectedDate.value = "";
for (w = 1; w < 7; w++) {
for (d = 0; d < 7; d++) {
if (!isNaN(myMonth[w][d])) {
calDateText[((7*w)+d)-7].innerText = myMonth[w][d];
} else {
calDateText[((7*w)+d)-7].innerText = " ";
         }
      }
   }
}
// End -->
</script>

</head>
<body>

	<script language="JavaScript" for=window event=onload>
<!-- Begin
var dCurDate = new Date();
frmCalendarSample.tbSelMonth.options[dCurDate.getMonth()].selected = true;
for (i = 0; i < frmCalendarSample.tbSelYear.length; i++)
if (frmCalendarSample.tbSelYear.options[i].value == dCurDate.getFullYear())
frmCalendarSample.tbSelYear.options[i].selected = true;
//  End -->
</script>

	<form name="frmCalendarSample" method="post" action="">
		<input type="hidden" name="calSelectedDate" value="">

		<table border="1">
			<tr>
				<td><select name="tbSelMonth"
					onchange='fUpdateCal(frmCalendarSample.tbSelYear.value, frmCalendarSample.tbSelMonth.value)'>
						<option value="1">January</option>
						<option value="2">February</option>
						<option value="3">March</option>
						<option value="4">April</option>
						<option value="5">May</option>
						<option value="6">June</option>
						<option value="7">July</option>
						<option value="8">August</option>
						<option value="9">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
				</select> <select name="tbSelYear"
					onchange='fUpdateCal(frmCalendarSample.tbSelYear.value, frmCalendarSample.tbSelMonth.value)'>
						<option value="1998">1998</option>
						<option value="1999">1999</option>
						<option value="2000">2000</option>
						<option value="2001">2001</option>
						<option value="2002">2002</option>
						<option value="2003">2003</option>
						<option value="2004">2004</option>
				</select></td>
			</tr>
			<tr>
				<td><script language="JavaScript">
var dCurDate = new Date();
fDrawCal(dCurDate.getFullYear(), dCurDate.getMonth()+1, 30, 30, "12px", "bold", 1);
</script></td>
			</tr>
		</table>
	</form>

</body>

</html>









<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Calendar | JavaScript Examples | UIZE JavaScript Framework</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="keywords" content="widget Uize.Widgets.Calendar.Widget"/>
  <meta name="description" content="See an example of a calendar widget that you can use on your own Web site to let users choose a date from a grid, with controls for navigating months."/>
  <link rel="alternate" type="application/rss+xml" title="UIZE JavaScript Framework - Latest News" href="http://www.uize.com/latest-news.rss"/>
  <link rel="stylesheet" href="../css/page.css"/>
  <link rel="stylesheet" href="../css/page.example.css"/>
  <style type="text/css">
    .calendarShell {
      display: inline-block;
      background: #fff;
      padding: 5px;
      border: 1px solid #ccc;
    }
  </style>
</head>

<body>

<script type="text/javascript" src="../js/Uize.js"></script>

<h1 class="header">
  <a id="page-homeLink" href="../index.html" title="UIZE JavaScript Framework home"></a>
  <a href="../index.html" class="homeLinkText" title="UIZE JavaScript Framework home">UIZE JavaScript Framework</a>
</h1>

<div class="main">
  <h1 class="document-title">
    <a href="../javascript-examples.html" class="breadcrumb breadcrumbWithArrow">JAVASCRIPT EXAMPLES</a>
    Calendar
    <div class="pageActionsShell">
      <div id="page-actions" class="pageActions"><a href="source-code/calendar.html" class="buttonLink">SOURCE</a></div>
    </div>
  </h1>

  explanation copy

  <div class="explanation">
    <p>In this example, an instance of the <a href="../reference/Uize.Widgets.Calendar.Widget.html"><code>Uize.Widgets.Calendar.Widget</code></a> class is used to wire up a simple calendar widget. Initially, the calendar's value is set to today's date. However, you can change it's value by clicking on a different date of this month, or you can use the arrows to navigate to and select a date from a different month. The month and year that the calendar displays are accessible through the <code>month</code> and <code>year</code> state properties, respectively. Below the calendar widget is a summary of its current state and some links to let you programmatically interact with the calendar. Play around with the calendar widget and see how the state updates, and mess with the links to control the calendar.</p>
  </div>

  <center>
    <div id="page-calendar" class="calendarShell"></div>
  </center>

  programmatic interface examples

  <div class="programmaticInterface">
    <ul>
      <li>Current State
        <ul>
          <li><b>calendar.get ('value') == </b>new Date ('<span id="page-calendarValue"></span>')</li>
          <li><b>calendar.get ('month') == </b><span id="page-calendarMonth"></span></li>
          <li><b>calendar.get ('year') == </b><span id="page-calendarYear"></span></li>
        </ul>
      </li>
      <li>Navigate Programmatically
        <ul>
          <li>MONTH
            <ul>
              <li>PREVIOUS MONTH: <a href="javascript://" class="linkedJs">calendar.set ({month:calendar.get ('month') - 1})</a></li>
              <li>NEXT MONTH: <a href="javascript://" class="linkedJs">calendar.set ({month:calendar.get ('month') + 1})</a></li>
            </ul>
          </li>
          <li>YEAR
            <ul>
              <li>PREVIOUS YEAR: <a href="javascript://" class="linkedJs">calendar.set ({year:calendar.get ('year') - 1})</a></li>
              <li>NEXT YEAR: <a href="javascript://" class="linkedJs">calendar.set ({year:calendar.get ('year') + 1})</a></li>
            </ul>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</div>

JavaScript code to insert the calendar widget and wire up the page

<script type="text/javascript">

Uize.require (
  [
    'UizeSite.Page.Example.library',
    'UizeSite.Page.Example',
    'Uize.Widgets.Calendar.Widget'
  ],
  function () {
    'use strict';

    /*** create the example page widget ***/
      var page = window.page = UizeSite.Page.Example ({evaluator:function (code) {eval (code)}});

    /*** add the calendar child widget ***/
      var calendar = page.addChild (
        'calendar',
        Uize.Widgets.Calendar.Widget,
        {
          built:false,
          size:'tiny'
        }
      );

    /*** wire up the page widget ***/
      page.wireUi ();

    /*** some code for demonstrating the widget's programmatic interface ***/
      function displayCalendarState () {
        page.setNodeValue ('calendarValue',calendar.get ('value'));
        page.setNodeValue ('calendarMonth',calendar.get ('month'));
        page.setNodeValue ('calendarYear',calendar.get ('year'));
      }
      calendar.wire ('Changed.value',displayCalendarState);
      calendar.wire ('Changed.month',displayCalendarState);
      calendar.wire ('Changed.year',displayCalendarState);
      displayCalendarState ();
  }
);

</script>

</body>
</html> -->
