<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--fullcalendar  -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='./resources/fullcalendar.min.css' rel='stylesheet' />
<link href='./resources/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='./resources/lib/moment.min.js'></script>
<script src='./resources/lib/jquery.min.js'></script>
<script src='./resources/fullcalendar.min.js'></script>

</head>
<body>
				<div id="calendar" style="width: 600px;"></div>
							 <script>
						 $(function() {
					              $('#calendar').fullCalendar({
					                defaultView: 'month',
					                defaultDate: '2019-02-12',
					                eventColor: 'green',
					                events: [
					                  {
					                    title: 'Long Event',
					                    start: '2019-03-07',
					                    end: '2019-03-10',
					                    color: 'green' 
					                  }
					                ]
					    
					              });
						 })
 
 						/* $('#calendar').fullCalendar({
					            }); 
							 
						0 */
							 </script>			  
		
</body>
</html>