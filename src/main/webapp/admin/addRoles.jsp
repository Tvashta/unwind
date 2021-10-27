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
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="icon" type="image/png" href="../assets/unwind.ico" />
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
                    <h3 class="page-title">Add Role</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="dashboard">Dashboard</a></li>
                        <li class="breadcrumb-item active">Add Role</li>
                    </ul>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Company Details</h4>
                    </div>
                    <div class="card-body">
                        <form onsubmit="return false" method="POST">
                            <div class="container">
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">No. of Employees</label>
                                    <div class="col-md-10">
                                        <input name="noe" id="noe" type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Add role</label>
                                    <div class="col-md-10">
                                        <div class="enter-text"></div>
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="new" style="display: flex;">
                                                    <input name="addrole" id="addrole" type="text" class="form-control">
                                                    <button onclick="addRole()" class="btn btn-primary"
                                                            style="margin-left: 20px;"><i class="bi bi-plus-lg"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Verify Password</label>
                                    <div class="col-md-10">
                                        <input name="password" id="password" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="input-group-append">
                                    <button onclick="clickfn()" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>

</div>


<script>
    let textbox = document.getElementById('addrole')
    let area = document.querySelector('.enter-text')

    function addRole() {
        area.innerHTML += "<div id='" + textbox.value + "'style='display: flex;'><p>" + textbox.value + "</p><button onclick=removeRole('" + textbox.value + "') class='cust-btn' style='margin-left: 20px;'><i class=\"bi bi-trash-fill\"></i></button></div>"
        textbox.value = ""
    }

    function removeRole(id) {
        let str = "" + id
        console.log(str)
        let text = document.getElementById(str)
        text.style.visibility = "collapse"
        text.style.position = "absolute"
    }


</script>
</body>
</html>