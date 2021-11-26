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
    <link rel="icon" type="image/png" href="../assets/unwind.ico"/>
    <link rel="stylesheet" href="../css/appr.css">
    <script>if('serviceWorker' in navigator){
        navigator.serviceWorker.register('sw.js')
    }
    </script>
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
<div class="container mt-5">
    <h1 class="text-center">Approve Leave Requests</h1>
    <h1>Employees</h1>
    <ul class="cards"  id="approve">
        
    </ul>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
let images={
		5:'https://www.enjpg.com/img/2020/hacker-37.jpg',
		4: "data:image/jpeg;base64,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",
		3:"https://www.wallpapertip.com/wmimgs/42-429058_night-fury-wallpaper-toothless.jpg",
		2: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnQTVogGwt3VQfDeVeDyU23kkiokSEersOWL0AL0SJuY7QUHAWfC99pyBmt3P98rjQzT4&usqp=CAU",
		6: "https://coolwallpapers.me/picsup/6088402-the-meg-movies-2018-movies-hd-ruby-rose-4k.jpg",
		1:"https://wallpaperaccess.com/full/6783523.jpg"
		
}
let leaves =<%=com.unwind.Utilities.getApproveRequests(session.getAttribute("username").toString())%>
leaves.map(leave=>{
	console.log(leave)
	let st=""
	if(leave[6]>0){
		st='<p class="mt-5" style="color:red;">Total number of leave taken exceeded limit by '+leave[6]+'</p>'
	}
	if(leave[6]==0){
		st='<p class="mt-5" style="color:red;">Total number of leave taken reached limit</p>'
	}
	$("#approve").append('<li class="booking-card" style="background-image: url('
			+images[leave[0]]+')"> <div class="book-container"><div class="content"></div></div><div class="info-container"><h2 class="name">'+
			leave[4]+'</h2><p class="role">'
			+leave[5]+'</p><p class="days"><i class="bi bi-calendar-event-fill mr-2"></i>'
	        + leave[2]+' days</p><div class="more-information"><div class="r-s-container"><button class="btn btn-danger box reject" onclick="changeLeaveStatus('+ leave[3]+',-1)" id="'
	        +leave[3]+'"><i class="bi bi-x-lg"></i>Reject</button><button class="btn btn-success box select" onclick="changeLeaveStatus('+leave[3] +',1)" id="'
	        +leave[3]+'"><i class="bi bi-check2-circle"></i>Accept</button></div><p class="mt-5">Reason: '
	        +leave[1]+'</p>'+st+'</div></div></li>')
})
function changeLeaveStatus(id, status){
	$.ajax({
	    url: '/unwind/approveLeave',
	    dataType: 'json',
	    data: {
	        id,
	        status
	    },
	    type: 'POST'
	    });
	window.location.assign('/unwind/employee/company.jsp')
}
</script>
</body>
</html>