<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<meta content="black" name="theme-color"/>
	<link rel="stylesheet" href="../css/sb.css">
	<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<!-- Bootstrap CSS -->
	<link rel="icon" type="image/png" href="../assets/unwind.ico" />
	<link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/pr.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" integrity="sha256-h20CPZ0QyXlBuAw7A+KluUYx/3pK+c7lYEpqLTlxjYQ=" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <title>Unwind </></title>
	<script>if('serviceWorker' in navigator){
		navigator.serviceWorker.register('sw.js')
	}
	</script>
	<link rel="manifest" href="../manifest.json"/>
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
    <div class="container ">
    <div class="main-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="card text-white bg-dark">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="https://wallpapercave.com/wp/wp8594123.jpg"
                                 alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                            <div class="mt-3">
                                <h4 id="name">Virat Kohli</h4>
                                <p id="role" class="text-secondary mb-1">Manager</p>
                                <p class="text-muted font-size-sm"></p>

                            </div>
                        </div>


                    </div>
                    <div class="col-lg-12">
                        <div class="card"></div>
                        <form class="card-body" action="/unwind/profile" method="post">
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Full Name</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" class="form-control" id="fname" name="name">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Email</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" class="form-control" id="email" name="email" readonly="readonly" value=<%=session.getAttribute("username").toString() %>>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Mobile</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" class="form-control" id="phno" name="phno">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9 text-secondary">
                                    <button type="submit" class="btn btn-primary px-4">Save changes</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="card text-white bg-dark">
                    <div class="card-body">
                        <h5 class="d-flex align-items-center mb-3">Leaves</h5>
                        <p>Total Days</p>
                        <div class="progress mb-3" style="height: 5px">
                            <div class="progress-bar bg-primary" role="progressbar" style="width: 100%"
                                 aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <p>Full Day Leaves</p>
                        <div class="progress mb-3" style="height: 5px">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 5%" aria-valuenow="5"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <p>Half Day Leaves</p>
                        <div class="progress mb-3" style="height: 5px">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 10%"
                                 aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script>
	let prof = <%= com.unwind.Utilities.profile(1, session.getAttribute("username").toString()) %>
	$("#name").text(prof.name)
	$("#role").text(prof.role)
	$("#phno").val(prof.phno)
	$("#fname").val(prof.name)
	console.log(prof)
	</script>
</html>