<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unwind </></title>
    <link rel="stylesheet" href="../css/sb.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/landing.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    <link rel="icon" type="image/png" href="../assets/unwind.ico" />
    <script>if('serviceWorker' in navigator){
        navigator.serviceWorker.register('../sw.js')
    }
    </script>
    <link rel="manifest" href="../manifest.json"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
<div class="container-landing">
<section class="home">
    <video class="video-slide active" src="../assets/1.mp4" autoplay muted loop></video>
    <video class="video-slide" src="../assets/2.mp4" autoplay muted loop></video>
    <video class="video-slide" src="../assets/3.mp4" autoplay muted loop></video>
    <video class="video-slide" src="../assets/4.mp4" autoplay muted loop></video>
    <div class="content active">
        <h1>Awesome.<br><span>Company</span></h1>
        <p>Some catchy tagline. Our company is a great company. If you need a company that is great, then we are the best choice. The best choice for all your wants and needs is our company</p>
        <a href="#">Visit us</a>
    </div>
    <div class="content">
        <h1>Team.<br><span>Work</span></h1>
        <p>Team work is awesome in our company. We work as a team for everything. That is one MVP for us. We are awesome because our teams are awesome. Lots of perks and fun but mandatory team activities are conducted which would be a boon to 20 year olds but would make life harder for people with homes!</p>
    </div>
    <div class="content">
        <h1>Innovations.<br><span>Brink of Tech</span></h1>
        <p>We are innovation. We are awesome. We are the best. <br/> Awesome company is the coolest company you can find!</p>
        <a href="#">Our products</a>
    </div>
    <div class="content">
        <h1>Let us grow<br><span>Together</span></h1>
        <p>Check out our careers portal to see the job opportunities present!</p>
        <a href="#">JOIN US!!</a>
    </div>
    <div class="media-icons">
        <a href="#"><i class="fab fa-facebook-f"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#" data-toggle="modal" data-target="#modalEdit"><i class="fas fa-edit"></i></a>
    </div>
    <div class="slider-navigation">
        <div class="nav-btn active"></div>
        <div class="nav-btn"></div>
        <div class="nav-btn"></div>
        <div class="nav-btn"></div>
    </div>
</section>
</div>
<div id="modalEdit" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Company Details</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <label> Name of the Company:
                    <input type="text">
                </label>
                <label> Description:
                    <input type="text">
                </label>
                <label> Website:
                    <input type="text">
                </label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" data-dismiss="modal">Save</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    const btns = document.querySelectorAll(".nav-btn");
    const slides = document.querySelectorAll(".video-slide");
    const contents = document.querySelectorAll(".content");

    var sliderNav = function(manual){
        btns.forEach((btn) => {
            btn.classList.remove("active");
        });

        slides.forEach((slide) => {
            slide.classList.remove("active");
        });

        contents.forEach((content) => {
            content.classList.remove("active");
        });

        btns[manual].classList.add("active");
        slides[manual].classList.add("active");
        contents[manual].classList.add("active");
    }

    btns.forEach((btn, i) => {
        btn.addEventListener("click", () => {
            sliderNav(i);
        });
    });
</script>
</body>
</html>
