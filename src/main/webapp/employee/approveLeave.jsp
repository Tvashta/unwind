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
    <ul class="cards">
        <li class="booking-card"
            style="background-image: url(https://www.wallpapertip.com/wmimgs/42-429058_night-fury-wallpaper-toothless.jpg)">
            <div class="book-container">
                <div class="content">
                </div>
            </div>
            <div class="info-container">
                <h2 class="name">Toothless</h2>
                <p class="role">Team Leader</p>
                <p class="days">
                    <i class="bi bi-calendar-event-fill mr-2"></i>
                    7 days
                </p>
                <div class="more-information">
                    <div class="r-s-container">
                        <button class="btn btn-danger box reject">
                            <i class="bi bi-x-lg"></i>
                            Reject
                        </button>
                        <button class="btn btn-success box select">
                            <i class="bi bi-check2-circle"></i>
                            Accept
                        </button>
                    </div>
                    <p class="mt-5">Reason: Have to go around the hidden world as the alpha</p>
                </div>
            </div>
        </li>
        <li class="booking-card"
            style="background-image: url(https://images.summitmedia-digital.com/preview/images/2016/06/24/6e3670dc8fa0f91cf075b1074c32c6ad.jpg)">
            <div class="book-container">
                <div class="content">
                </div>
            </div>
            <div class="info-container">
                <h2 class="name">Regina George</h2>
                <p class="role">Head of PR</p>
                <p class="days">
                    <i class="bi bi-calendar-event-fill mr-2"></i>
                    3 days
                </p>
                <div class="more-information">
                    <div class="r-s-container">
                        <button class="btn btn-danger box reject">
                            <i class="bi bi-x-lg"></i>
                            Reject
                        </button>
                        <button class="btn btn-success box select">
                            <i class="bi bi-check2-circle"></i>
                            Accept
                        </button>
                    </div>
                    <p class="mt-5">Reason: Emergency! The details are too personal to be disclosed. </p>
                </div>
            </div>
        </li>
        <li class="booking-card"
            style="background-image: url(https://www.enjpg.com/img/2020/hacker-37.jpg)">
            <div class="book-container">
                <div class="content">
                </div>
            </div>
            <div class="info-container">
                <h2 class="name">Heckkker</h2>
                <p class="role">Tech Support</p>
                <p class="days">
                    <i class="bi bi-calendar-event-fill mr-2"></i>
                    1 month
                </p>
                <div class="more-information">
                    <div class="r-s-container">
                        <button class="btn btn-danger box reject">
                            <i class="bi bi-x-lg"></i>
                            Reject
                        </button>
                        <button class="btn btn-success box select">
                            <i class="bi bi-check2-circle"></i>
                            Accept
                        </button>
                    </div>
                    <p class="mt-5">Reason: Slipped, fell and broke bones. Now unable to wear hoodie</p>
                </div>
            </div>
        </li>
    </ul>
</div>

</body>
</html>