<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Unwind </></title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <meta content="black" name="theme-color"/>
    <link rel="stylesheet" href="../css/sb.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="icon" type="image/png" href="../assets/unwind.ico" />
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
            <a href="addRoles.jsp">
                <i class='bi bi-node-plus-fill'></i>
            </a>
            <span class="tooltip">Add Roles</span>
        </li>
        <li>
            <a href="assignRoles.jsp">
                <i class='bx bx-award'></i>
            </a>
            <span class="tooltip">Assign Roles</span>
        </li>
        <li>
            <a href="calendar.jsp">
                <i class="bi bi-calendar-event-fill"></i>
            </a>
            <span class="tooltip">View Calendar</span>
        </li>
        <li>
            <a href="rules.jsp">
                <i class="bi bi-card-list"></i>
            </a>
            <span class="tooltip">Set rules</span>
        </li>
        <li>
            <a href="profile.jsp">
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
<div class="page-wrapper">
    <div class="content container-fluid w-75 p-5">
        <div class="page-header">
            <div class="row">
                <div class="col">
                    <h3 class="page-title">Set Rules</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="dashboard">Dashboard</a></li>
                        <li class="breadcrumb-item active">Set Rules</li>
                    </ul>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title d-inline">Permissions</h4>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-horizontal mb-2 list-group-flush">
                            <li class="list-group-item w-30 d-inline-block mr-3 "><strong>Role</strong></li>
                            <li class="list-group-item w-30 d-inline-block mr-3 border-top-0"><strong>Leave Constraint</strong></li>
                            <li class="list-group-item w-30 d-inline-block border-top-0"><strong>Reports to</strong></li>
                        </ul>
                        <div id="rules">
                            <ul class="list-group list-group-horizontal mb-1 list-group-flush ">
                                <li class="list-group-item w-30 d-inline-block mr-3 border-0">Officer</li>
                                <li class="list-group-item w-30 d-inline-block mr-3 border-0 "> > 15 days</li>
                                <li class="list-group-item w-30 d-inline-block border-0">HR</li>
                            </ul>
                            <ul class="list-group list-group-horizontal mb-1 list-group-flush ">
                                <li class="list-group-item w-30 d-inline-block mr-3 border-0">Officer</li>
                                <li class="list-group-item w-30 d-inline-block mr-3 border-0 ">2-15 days</li>
                                <li class="list-group-item w-30 d-inline-block border-0">Manager</li>
                            </ul>
                            <ul class="list-group list-group-horizontal mb-1 list-group-flush ">
                                <li class="list-group-item w-30 d-inline-block mr-3 border-0">Officer</li>
                                <li class="list-group-item w-30 d-inline-block mr-3 border-0 ">1 day</li>
                                <li class="list-group-item w-30 d-inline-block border-0">Team Leader</li>
                            </ul>
                            <ul class="list-group list-group-horizontal mb-1 list-group-flush ">
                                <li class="list-group-item w-30 d-inline-block mr-3 border-0">Officer</li>
                                <li class="list-group-item w-30 d-inline-block mr-3 border-0 ">1/2 day</li>
                                <li class="list-group-item w-30 d-inline-block border-0">Automated</li>
                            </ul>
                        </div>
                        <input type="text" name="from-role" placeholder="Role" class="form-control w-30 mr-3 d-inline-block"/>
                        <input type="text" name="constraint" placeholder="Constraint" class="form-control mr-3 w-30 d-inline-block"/>
                        <input type="text" name="to-role" placeholder="Reports to" class="form-control w-30 d-inline-block"/>
                        <button class="btn btn-outline-dark float-right d-inline-block" onclick="addRule()"><i
                                class="bi bi-person-plus-fill"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
                crossorigin="anonymous"></script>
        <script>
        function addRule(){
            $("#rules").append('<ul class="list-group list-group-horizontal mb-1 list-group-flush ">' +
                '<li class="list-group-item w-30 d-inline-block mr-3 border-0">'+$("input[name=from-role]").val()+'</li>' +
                '<li class="list-group-item w-30 d-inline-block mr-3 border-0 ">'+$("input[name=constraint]").val()+'</li>' +
                '<li class="list-group-item w-30 d-inline-block border-0">'+$("input[name=to-role]").val()+'</li>' +
                '</ul>')
           $("input[name=from-role]").val("")
            $("input[name=constraint]").val("")
            $("input[name=to-role]").val("")
        }
        </script>
</body>
</html>