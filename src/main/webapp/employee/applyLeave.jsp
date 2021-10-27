<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Unwind </></title>
    <link rel="stylesheet" href="../css/sb.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link href="../css/lvpp.css" rel='stylesheet' type='text/css'>
    <link rel="icon" type="image/png" href="../assets/unwind.ico" />
    <script>if('serviceWorker' in navigator){
        navigator.serviceWorker.register('sw.js')
    }
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <meta content="black" name="theme-color"/>
</head>
<body style="background-image: url('../assets/lightcurves.jpg')">
<%
	response.setHeader("Cache-Control", "no-cache no-store must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires","0");
	if(session.getAttribute("username")==null)
	response.sendRedirect("../login.jsp");
%>
<div class="sidebar">
    <div class="logo-details">
        <i class="bi bi-code-slash"></i>
    </div>
    <ul class="nav-list">
        <li>
            <a href="company.jsp">
                <i class='bx bxs-detail'></i>
            </a>
            <span class="tooltip">Company details</span>
        </li>
        <li>
            <a href="applyLeave.jsp">
                <i class="bi bi-arrow-right-square-fill"></i>
            </a>
            <span class="tooltip">Apply Leave</span>
        </li>
        <li>
            <a href="approveLeave.jsp">
                <i class="bi bi-bell-fill"></i>
            </a>
            <span class="tooltip">Approve Leave</span>
        </li>
        <li>
            <a href="calendar.jsp">
                <i class="bi bi-calendar-event-fill"></i>
            </a>
            <span class="tooltip">View Calendar</span>
        </li>
        <li>
            <a href="employeeProfile.jsp">
                <i class='bx bx-user'></i>
            </a>
            <span class="tooltip">View Profile</span>
        </li>
        <li class="last">
		<form action="/unwind/logout">
		<button class="btn btn-outline-dark" type="submit">
				<i class="bi bi-box-arrow-right"></i>
			</button>
			<span class="tooltip">Logout</span>
			</form>
		</li>
    </ul>
</div>
<div class="brand">
    <h1>Leave Application</h1>
</div>
<div class="bigbox">
    <form action="/unwind/applyLeave" method="post">
        <div class="box">
            <h1>Application</h1>
            <%if(session.getAttribute("error")!=null){ %>
      <div class="alert alert-danger" role="alert">
	  <%=session.getAttribute("error") %>
	   </div>
	   <%} %>
            <div class="elements">
                <label>Employee ID</label>
                <input type="text" name="empid" id="empid" placeholder="Employee ID" class="email" readonly="readonly">
            </div>

            <div class="elements">
                <label>Reason</label>
                <input type="text" name="reason" placeholder="Reason" class="email">
            </div>

            <div class="elements">
                <label>Number of days</label>
                <input type="number" name="days" placeholder="Number of days" class="email">
                
            </div>
                <div><button class="btn3" type="submit">Apply</div>
        </div>
    </form>
     <div class="box">
            <h1>Leave Requests</h1>
            <table class="table">
            <thead>
            <tr>
             <th scope="col">Request Id</th>
             <th scope="col">Reason</th>
             <th scope="col">Number of days</th>
             <th scope="col">Status</th>
            </tr>
            </thead>
             <tbody id="table-body">
             </tbody>
            </table>
      </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script>
	let prof = <%= com.unwind.Utilities.getEmpId(session.getAttribute("username").toString()) %>
	$("#empid").val(prof)
	let leaves =<%=com.unwind.Utilities.getLeaveRequests(session.getAttribute("username").toString())%>
	console.log(leaves)
    leaves.map(req=>{
    	$("#table-body").append('<tr><td>' + req[0] + '</td><td>' +
                 req[1] + '</td><td>' + req[2]+'</td><td>'+req[3]+
                '</td></tr>')	
    })
	
	</script>
</html>