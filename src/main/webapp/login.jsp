<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Reliable Systems">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico">
    <title>DO - Login</title>

    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/core.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/components.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/pages.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/menu.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/responsive.css" rel="stylesheet" type="text/css" />

    <script src="${pageContext.request.contextPath}/assets/js/modernizr.min.js"></script>

</head>


<body>

<div id="preloader">
    <div id="status">
        <div class="spinner">
            <div class="spinner-wrapper">
                <div class="rotator">
                    <div class="inner-spin"></div>
                    <div class="inner-spin"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<section>
    <div class="container-alt">
        <div class="row">
            <div class="col-sm-12">

                <div class="wrapper-page">

                    <div class="m-t-40 account-pages">
                        <div class="text-center account-logo-box">
                            <h2 class="text-uppercase">
                                <a class="text-success">
                                    <span><img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="" height="36"></span>
                                </a>
                            </h2>
                        </div>
                        <div class="account-content">
                            <form class="form-horizontal" action="j_spring_security_check" METHOD=POST>

                                <div class="form-group ">
                                    <div class="col-xs-12">
                                        <input class="form-control" type="text" required name="j_username" id="j_username" placeholder="Username">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <input class="form-control" type="password" required name="j_password" placeholder="Password">
                                    </div>
                                </div>

                                <div class="form-group account-btn text-center m-t-10">
                                    <div class="col-xs-12">
                                        <button class="btn w-md btn-bordered btn-danger waves-effect waves-light" type="submit">Ingresar</button>
                                    </div>
                                </div>

                            </form>

                            <div class="clearfix"></div>

                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</section>

<script>
    var resizefunc = [];
</script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/detect.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.blockUI.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/waves.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollTo.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.core.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.app.js"></script>

<script>
    $(document).ready(function () {
        setTimeout(function () {
            $("#j_username").focus();
        }, 200);
    })
</script>

</body>
</html>