<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="en" data-ng-app="app">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="reliablesystems">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico">
    <title>DO</title>
    <tiles:insertAttribute name="Lib_css"/>
    <tiles:insertAttribute name="head"/>

    <script src="${pageContext.request.contextPath}/assets/js/modernizr.min.js"></script>

</head>

<body class="fixed-left">

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

<div id="wrapper">

    <tiles:insertAttribute name="header"/>


    <tiles:insertAttribute name="sidebar"/>

    <div class="content-page">

        <tiles:insertAttribute name="body"/>


        <tiles:insertAttribute name="footer"/>

    </div>


</div>

<tiles:insertAttribute name="Lib_js"/>
<tiles:insertAttribute name="scripts"/>
</body>

</html>