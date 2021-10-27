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
                    <h3 class="page-title">Assign Roles</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="dashboard">Dashboard</a></li>
                        <li class="breadcrumb-item active">Assign Roles</li>
                    </ul>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title d-inline">Employees</h4>
                        <form class="d-inline float-right form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i
                                    class="bi bi-search"></i></button>
                        </form>
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead class="thead-dark">
                            <tr>
                                <th scope="col">Emp ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Role</th>
                                <th scope="col"><i class="bi bi-pencil-fill"></i></th>
                            </tr>
                            </thead>
                            <tbody id="table-body">
                            <tr data-eid="EMP01ABC" data-name="Lelouch vi Brittania" data-role="CEO">
                                <td>EMP01ABC</td>
                                <td>Lelouch vi Brittania</td>
                                <td>CEO</td>
                                <td style="width: 12%">
                                    <button type="button" class="btn btn-outline-info btn-edit"><i
                                            class="bi bi-pencil-fill"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-delete"><i
                                            class="bi bi-trash-fill"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr data-eid="EMP11XXW" data-name="Ruby Rose" data-role="Head of HR">
                                <td>EMP11XXW</td>
                                <td>Ruby Rose</td>
                                <td>Head of HR</td>
                                <td style="width: 12%">
                                    <button type="button" class="btn btn-outline-info btn-edit"><i
                                            class="bi bi-pencil-fill"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-delete"><i
                                            class="bi bi-trash-fill"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr data-eid="EMP91BAW" data-name="Bruce Wayne" data-role="CFO">
                                <td>EMP91BAW</td>
                                <td>Bruce Wayne</td>
                                <td>CFO</td>
                                <td style="width: 12%">
                                    <button type="button" class="btn btn-outline-info btn-edit"><i
                                            class="bi bi-pencil-fill"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-delete"><i
                                            class="bi bi-trash-fill"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr data-eid="EMP00AAA" data-name="Gandalf the Gray" data-role="Chairman">
                                <td>EMP00AAA</td>
                                <td>Gandalf the Gray</td>
                                <td>Board Chairman</td>
                                <td style="width: 12%">
                                    <button type="button" class="btn btn-outline-info btn-edit"><i
                                            class="bi bi-pencil-fill"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-delete"><i
                                            class="bi bi-trash-fill"></i>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
                <button class="btn btn-outline-dark float-right mt-4" data-toggle="modal" data-target="#addEmployee"><i
                        class="bi bi-person-plus-fill"></i></button>
                <div class="modal fade" id="addEmployee" tabindex="-1" aria-labelledby="addEmployeeLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addEmployeeLabel">Add employee</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <input type="text" id="name" class="form-control mb-2" placeholder="Name">
                                <input type="text" id="id" class="form-control mb-2" placeholder="Employee ID">
                                <select class="custom-select" id="role">
                                    <option value="Officer" selected>Officer</option>
                                    <option value="CEO">CEO</option>
                                    <option value="CFO">CFO</option>
                                    <option value="Tech Lead">Tech Lead</option>
                                    <option value="Chairman">Board Chairman</option>
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-info" onclick="addEmployee()">Add</button>
                            </div>
                        </div>
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
    function addEmployee() {
        let eid = $('#id').val(),
            name = $('#name').val(),
            role = $('#role').val()
        $("#table-body").append('<tr data-eid =' + eid + ' data-name=' + name + ' data-role=' + role + ' >' +
            '<td>' + eid + '</td>' +
            '<td>' + name + '</td>' +
            ' <td>' + role + '</td>' +
            '<td style="width: 12%">' +
            ' <button type="button" class="btn btn-outline-info btn-edit"><i class="bi bi-pencil-fill"></i></button>' +
            '<button type="button" class="btn btn-danger btn-delete"><i class="bi bi-trash-fill"></i></button>' +
            '</td>' +
            '</tr>')
        $('#addEmployee').modal('hide')
    }

    $("body").on("click", ".btn-delete", function () {
        $(this).parents("tr").remove();
    }).on("click", ".btn-edit", function () {
        console.log($(this))
        const eid = $(this).parents("tr").attr("data-eid")
        const name = $(this).parents("tr").attr("data-name")
        const role = $(this).parents("tr").attr("data-role")
        console.log(name, eid, role)

        $(this).parents("tr").find("td:eq(0)").html('<input class="form-control mb-2" name="edit_eid" value="' + eid + '">')
        $(this).parents("tr").find("td:eq(1)").html('<input class="form-control mb-2" name="edit_name" value="' + name + '">')
        $(this).parents("tr").find("td:eq(2)").html(' <select class="custom-select" id="edit_role">' +
            '<option value="Officer">Officer</option>' +
            '<option value="CEO">CEO</option>' +
            '<option value="CFO">CFO</option>' +
            '<option value="Tech Lead">Tech Lead</option>' +
            ' <option value="Chairman">Board Chairman</option>' +
            '</select>')
        $('#edit_role option:selected').attr("selected", null)
        $('#edit_role option[value =' + role + ' ]').attr("selected", "selected");
        $(this).parents("tr").find("td:eq(3)").prepend("<div class='save-cancel'><button class=\"btn btn-outline-success btn-save mr-2\"'><i class=\"bi bi-check-lg\"></i></button><button class=\"btn btn-danger btn-cancel\"><i class=\"bi bi-x-lg\"></i></button></div>")
        $(this).hide();
        $(this).parents("tr").find("td:eq(3)").find(".btn-delete").hide()
    }).on("click", ".btn-save", function () {
        const eid = $($(this).parents("tr").find("td:eq(0)").find("input")).val()
        const name = $($(this).parents("tr").find("td:eq(1)").find("input")).val()
        const role = $($(this).parents("tr").find("td:eq(2)").find("select option:selected")).val()

        $(this).parents("tr").find("td:eq(0)").text(eid);
        $(this).parents("tr").find("td:eq(1)").text(name);
        $(this).parents("tr").find("td:eq(2)").text(role);

        $(this).parents("tr").attr('data-name', name);
        $(this).parents("tr").attr('data-eid', eid);
        $(this).parents("tr").attr('data-role', role);

        $(this).parents("tr").find(".btn-edit").show();
        $(this).parents("tr").find(".btn-delete").show();
        $(this).parents("tr").find("div.save-cancel").remove();
    }).on("click", ".btn-cancel", function () {
        const eid = $(this).parents("tr").attr("data-eid")
        const name = $(this).parents("tr").attr("data-name")
        const role = $(this).parents("tr").attr("data-role")

        $(this).parents("tr").find("td:eq(0)").text(eid);
        $(this).parents("tr").find("td:eq(1)").text(name);
        $(this).parents("tr").find("td:eq(2)").text(role);

        $(this).parents("tr").find(".btn-edit").show();
        $(this).parents("tr").find(".btn-delete").show();
        $(this).parents("tr").find("div.save-cancel").remove();
    })
</script>
</body>
</html>