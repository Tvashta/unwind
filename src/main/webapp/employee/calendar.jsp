<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Unwind </></title>
    <link rel="stylesheet" href="../css/sb.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/calendar.css">
    <link rel="icon" type="image/png" href="../assets/unwind.ico" />
    <script>if('serviceWorker' in navigator){
        navigator.serviceWorker.register('sw.js')
    }
    </script>
    <link rel="manifest" href="../manifest.json"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <meta content="black" name="theme-color"/>
</head>
<body>
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
<div class="container">
<main>
    <table class="calendar">
        <caption class="calendar__banner--month">
            <h1>October</h1>
        </caption>
        <thead>
        <tr>
            <th class="calendar__day__header">Sun</th>
            <th class="calendar__day__header">Mon</th>
            <th class="calendar__day__header">Tues</th>
            <th class="calendar__day__header">Wed</th>
            <th class="calendar__day__header">Thurs</th>
            <th class="calendar__day__header">Fri</th>
            <th class="calendar__day__header">Sat</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="calendar__day__cell"></td>
            <td class="calendar__day__cell"></td>
            <td class="calendar__day__cell"></td>
            <td class="calendar__day__cell"></td>
            <td class="calendar__day__cell" id="1">1</td>
            <td class="calendar__day__cell" id="2">2</td>
            <td class="calendar__day__cell" id="3">3</td>
         </tr>
  		<tr>
            <td class="calendar__day__cell" id="4">4</td>
            <td class="calendar__day__cell" id="5">5</td>
            <td class="calendar__day__cell" id="6">6</td>
            <td class="calendar__day__cell" id="7">7</td>
            <td class="calendar__day__cell" id="8">8</td>
            <td class="calendar__day__cell" id="9">9</td>
            <td class="calendar__day__cell" id="10">10</td>
         </tr>
         <tr>
            <td class="calendar__day__cell" id="11">11</td>
            <td class="calendar__day__cell" id="12">12</td>
            <td class="calendar__day__cell" id="13">13</td>
            <td class="calendar__day__cell" id="14">14</td>
            <td class="calendar__day__cell" id="15">15</td>
            <td class="calendar__day__cell" id="16">16</td>
            <td class="calendar__day__cell" id="17">17</td>
         </tr>
         <tr>
            <td class="calendar__day__cell" id="18">18</td>
            <td class="calendar__day__cell" id="19">19</td>
            <td class="calendar__day__cell" id="20">20</td>
            <td class="calendar__day__cell" id="21">21</td>
            <td class="calendar__day__cell"id="22">22</td>
            <td class="calendar__day__cell" id="23">23</td>
            <td class="calendar__day__cell" id="24">24</td>
         </tr>
         <tr>
            <td class="calendar__day__cell" id="25">25</td>
            <td class="calendar__day__cell" id="26">26</td>
            <td class="calendar__day__cell" id="27">27</td>
            <td class="calendar__day__cell" id="28">28</td>
            <td class="calendar__day__cell" id="29">29</td>
            <td class="calendar__day__cell" id="30">30</td>
            <td class="calendar__day__cell" id="31">31</td>
        </tr>
        </tbody>
    </table>
</main>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script>
	let days= <%= com.unwind.Utilities.days(1,0)%>
	days.map(x=>{
		$('#'+x[0]).attr('data-opt', x[1]);
	})
	days= <%= com.unwind.Utilities.days(1,1)%>
	days.map(x=>{
		$('#'+x[0]).attr('data-event', x[1]);
	})
</script>
</body>
</html>