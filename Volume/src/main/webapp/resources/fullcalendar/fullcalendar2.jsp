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
   <div id="calendar" style="width: 100%;"></div>
   <div id="dataArea" style="height: 500px;"></div>
   <script>
   
  
   $(document).ready(function name() {
      $("#calendar").fullCalendar({
         header: {
            left: '',
            center: 'title',
            right: ''
         },
         events: function(start, end, timezone, callback) {
            $.ajax({
               type: "POST",
                 contentType: "application/json; charset=utf-8", 
                 url: "CalendarView2.do", 
                 dataType: 'json',
                 success: function(data){
                    console.log(data);
                    var events= [];
                   
                    
                    $.each(data, function (index,value) {
                      events.push({
                         id: value['id'],
                         title: value['title'],
                         start: value['start_date'],
                         end: value['end_date'],
                         idx: value['idx']
                      });
                      
                      console.log(value);
                  });
                    
                    callback(events);
                },
                error: function (e) {
               alert("에러발생"+e.status+":"+e.statusText);
            }
            });
         },
         eventClick: function(event) {
        	 location.href="./ProjectBbsViewController.do?idx="+event.idx;
        	 //alert(event.idx);
         }
         
      });
   });


   
   </script>           
      
</body>
</html>