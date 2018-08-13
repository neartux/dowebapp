<div class="left side-menu">
    <div class="sidebar-inner slimscrollleft">

        <div id="sidebar-menu">
            <div class="user-details">
                <div class="overlay"></div>
                <div class="text-center">
                    <img src="${pageContext.request.contextPath}/assets/images/users/no-avatar.png" alt="" class="thumb-md img-circle">
                </div>
                <div class="user-info">
                    <div>
                        <a href="#setting-dropdown" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            ${pageContext.request.userPrincipal.name} <span class="mdi mdi-menu-down"></span></a>
                    </div>
                </div>
            </div>

            <div class="dropdown" id="setting-dropdown">
                <ul class="dropdown-menu">
                    <li><a href="javascript:void(0)"><i class="mdi mdi-face-profile m-r-5"></i> Profile</a></li>
                    <li><a><i class="mdi mdi-logout m-r-5"></i> Logout</a></li>
                </ul>
            </div>

            <ul>
                <li class="menu-title">Navegaci&oacute;n</li>
                <li>
                    <a href="${pageContext.request.contextPath}/patient/display" class="waves-effect">
                        <i class="mdi mdi-account-multiple-outline"></i><span> Pacientes </span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/doctor/display" class="waves-effect">
                        <i class="fa fa-user-md"></i><span> M&eacute;dicos </span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/doctorsoffice/display" class="waves-effect">
                        <i class="fa fa-hospital-o"></i><span> Consultorios </span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/itinerary/display" class="waves-effect">
                        <i class="fa fa-calendar-check-o"></i><span> Itinerario </span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/diary/display" class="waves-effect">
                        <i class="fa fa-calendar-check-o"></i><span> Agenda </span>
                    </a>
                </li>


            </ul>
        </div>

        <div class="clearfix"></div>

        <div class="help-box">
            <h5 class="text-muted m-t-0">For Help ?</h5>
            <p class=""><span class="text-dark"><b>Email:</b></span> <br/> support@support.com</p>
            <p class="m-b-0"><span class="text-dark"><b>Call:</b></span> <br/> (+123) 123 456 789</p>
        </div>

    </div>

</div>