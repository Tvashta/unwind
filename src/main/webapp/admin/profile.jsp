<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/sb.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/pr.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
          integrity="sha256-h20CPZ0QyXlBuAw7A+KluUYx/3pK+c7lYEpqLTlxjYQ=" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <title>Unwind </></title>
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
<div class="container ">
    <div class="main-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="card text-white bg-dark">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRg61kc6vPiirZWJyd1lJ8Zf60uPa4Nlht6A&usqp=CAU"
                                 alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                            <div class="mt-3">
                                <h4>Virat Kohli</h4>
                                <p class="text-secondary mb-1">Admin</p>
                                <p class="text-secondary mb-1">Awesome Company</p>
                                <p class="text-muted font-size-sm"></p>

                            </div>
                        </div>


                    </div>
                    <div class="col-lg-12">
                        <div class="card"></div>
                        <div class="card-body">
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Full Name</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" class="form-control" value="Virat kohli">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Email</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" class="form-control" value="virat@example.com">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Mobile</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" class="form-control" value="9559551258">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Address</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" class="form-control" value="No:93,Gp Homes,Chennai">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="button" class="btn btn-primary px-4" value="Save Changes">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>