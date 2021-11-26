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
                            <li class="list-group-item w-30 d-inline-block mr-3 border-top-0"><strong>Leave From [In days]</strong></li>
                             <li class="list-group-item w-30 d-inline-block mr-3 border-top-0"><strong>Leave To [In days]</strong></li>
                            <li class="list-group-item w-30 d-inline-block border-top-0"><strong>Reports to</strong></li>
                        </ul>
                        <div id="rules">
                         
                        </div>
                        
                        <select class="custom-select form-control w-25 mr-2 d-inline-block" id="from-role" name="from-role" >
                                    
                         </select>
                        
                        <input type="number" value="0" name="from-leave" placeholder="Leave From" class="form-control mr-4 w-20 d-inline-block"/>
                         <input type="number" value="0" name="to-leave" placeholder="Leave To" class="form-control mr-2 w-20 d-inline-block"/>
                        <select class="custom-select form-control w-25 d-inline-block" id="to-role" name="to-role" >         
                         <option value="Automatic">Automatic</option>
                         </select>
                        <button class="btn btn-outline-dark float-right d-inline-block" onclick="addRule()"><i
                                class="bi bi-person-plus-fill"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
                crossorigin="anonymous"></script>
        <script>
        let roles=<%=com.unwind.Utilities.getRoles(session.getAttribute("username").toString())%>
        let rules=<%=com.unwind.Utilities.getRules(session.getAttribute("username").toString())%>
        roles.map(role=>{
        	$('#from-role').append('<option class="form-control w-25 mr-2 d-inline-block" value ='+role+'>'+role+'</option>')
        	$('#to-role').append('<option class="form-control w-25 mr-2 d-inline-block" value ='+role+'>'+role+'</option>')
        })
        rules.map(rule=>{
        	addRule(rule[0],rule[1],rule[2],rule[3],false)
        })
        
        function addRule(fromRole=$("select[name=from-role]").val(), fromLeave=$("input[name=from-leave]").val(), toLeave=$("input[name=to-leave]").val(),toRole=$("select[name=to-role]").val(), post=true){
            $("#rules").append('<ul class="list-group list-group-horizontal mb-1 list-group-flush ">' +
                '<li class="list-group-item w-25 d-inline-block mr-3 border-0">'+fromRole+'</li>' +
                '<li class="list-group-item w-25 d-inline-block mr-3 border-0 ">'+fromLeave+'</li>' +
                '<li class="list-group-item w-25 d-inline-block mr-3 border-0 ">'+toLeave+'</li>' +
                '<li class="list-group-item w-25 d-inline-block border-0">'+toRole+'</li>' +
                '</ul>')
           $("input[name=from-role]").val("")
            $("input[name=from-leave]").val("")
            $("input[name=to-role]").val("")
            $("input[name=to-leave]").val("")
         	if(post){
         		$.ajax({
        		    url: '/unwind/rules',
        		    dataType: 'json',
        		    data: {
        		    	fromRole,
        		    	toRole,
        		    	from:fromLeave,
        		    	to:toLeave
        		    },
        		    type: 'POST'
        		    });
         	}   
        }
        </script>
</body>
</html>