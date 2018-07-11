<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">

        <div class="content">
            <div class="container">


                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Form elements </h4>
                            <ol class="breadcrumb p-0 m-0">
                                <li>
                                    <a href="#">Zircos</a>
                                </li>
                                <li>
                                    <a href="#">Forms </a>
                                </li>
                                <li class="active">
                                    Form elements
                                </li>
                            </ol>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box">
                            <h4 class="m-t-0 header-title"><b>Input Types</b></h4>
                            <p class="text-muted m-b-30 font-13">
                                Most common form control, text-based input fields. Includes support for all HTML5 types: <code>text</code>, <code>password</code>, <code>datetime</code>, <code>datetime-local</code>, <code>date</code>, <code>month</code>, <code>time</code>, <code>week</code>, <code>number</code>, <code>email</code>, <code>url</code>, <code>search</code>, <code>tel</code>, and <code>color</code>.
                            </p>
                            <div class="row">
                                <div class="col-md-6">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Text</label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" value="Some text value...">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label" for="example-email">Email</label>
                                            <div class="col-md-10">
                                                <input type="email" id="example-email" name="example-email" class="form-control" placeholder="Email">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Password</label>
                                            <div class="col-md-10">
                                                <input type="password" class="form-control" value="password">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Placeholder</label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" placeholder="placeholder">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Text area</label>
                                            <div class="col-md-10">
                                                <textarea class="form-control" rows="5"></textarea>
                                            </div>
                                        </div>



                                    </form>
                                </div>

                                <div class="col-md-6">
                                    <form class="form-horizontal">

                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Readonly</label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" readonly="" value="Readonly value">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Disabled</label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" disabled="" value="Disabled value">
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Static control</label>
                                            <div class="col-sm-10">
                                                <p class="form-control-static">email@example.com</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Helping text</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" placeholder="Helping text">
                                                <span class="help-block"><small>A block of help text that breaks onto a new line and may extend beyond one line.</small></span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Input Select</label>
                                            <div class="col-sm-10">
                                                <select class="form-control">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
                                                <h6>Multiple select</h6>
                                                <select multiple="" class="form-control">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
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

    </tiles:putAttribute>

    <tiles:putAttribute name="scripts">
        <script>

            $(function () {
            });

        </script>

    </tiles:putAttribute>

</tiles:insertDefinition>