<%--
  Created by IntelliJ IDEA.
  User: Xie Youjun
  Date: 2018/03/15
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JapanMoveUpWestAdmin</title>

    <!-- Bootstrap -->
    <link href="/static/admin/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/static/admin/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/static/admin/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/static/admin/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="/static/admin/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="/static/admin/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="/static/admin/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="/static/admin/vendors/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="/static/admin/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- bootstrap-fileinput -->
    <link href="/static/admin/vendors/bootstrap-fileinput/css/fileinput.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/static/admin/build/css/custom.min.css" rel="stylesheet">

    <style>
        .validatorError {
            color: red;
        }
        .select2-container--default .select2-selection--multiple {
            border-radius:0;
            border: 1px solid #ccc;;
            width: 540px;
            height: 34px;
        }
        .file-caption .form-control .kv-fileinput-caption .icon-visible{
            display: none;
        }
        .input-group-btn .input-group-append{
            text-align: right;
        }
        .btn .btn-primary .btn-file{
            float: right;
            border-radius: 3px;
        }
        .form-group .btn{
            margin-bottom: 0px;
        }
        .btn-file{
            float: right;
        }
        .input-group .form-control, .input-group-addon, .input-group-btn{

        }
    </style>

</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">


        <!-- sidebar menu -->
        <jsp:include page="./sidebar.jsp" flush="true"/>
        <!-- /sidebar menu -->


        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <nav>
                    <div class="nav toggle">
                        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                    </div>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="">
                            <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                               aria-expanded="false">
                                <span style="color: silver">Admin管理者&nbsp;&nbsp;</span>岡山 太郎
                                <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu pull-right">
                                <li><a href="javascript:;">Help</a></li>
                                <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                            </ul>
                        </li>


                    </ul>
                </nav>
            </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>カテゴリ管理</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>カテゴリリスト</h2>
                            <div class="clearfix"></div>
                        </div>

                        <form:form modelAttribute="eventRegistForm" enctype="multipart/form-data" method="post"
                                   action="${pageContext.request.contextPath}/admin/category/regist/" id="userForm"
                                   class="form-horizontal form-label-left">
                        <div class="x_content">
                            <div class="form-group">
                                <label class="control-label col-md-2 col-sm-1 col-xs-12">カテゴリ名<span
                                        class="required" style="color: red">*</span>
                                </label>
                                <div class="col-md-8 col-sm-3 col-xs-12 form-group has-feedback">
                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"
                                          style="width: 40px"></span>
                                    <form:input path="title" id="title"
                                                class="form-control col-md-3 col-xs-12 has-feedback-left" required="required"/>
                                </div>
                            </div>

                            <hr/>

                            <div class="form-group">
                                <label class="control-label col-md-2 col-sm-1 col-xs-12">操作者<span
                                        class="required" style="color: red">*</span>
                                </label>
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"
                                          style="width: 40px"></span>
                                    <form:input path="gustName" id="gustName"
                                                class="form-control col-md-3 col-xs-12 has-feedback-left" required="required"/>
                                </div>
                                <label class="control-label col-md-2 col-sm-1 col-xs-12">カラー<span
                                        class="required" style="color: red">*</span>
                                </label>
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"
                                          style="width: 40px"></span>
                                    <form:input path="hallName" id="hallName"
                                                class="form-control col-md-3 col-xs-12 has-feedback-left" required="required"/>
                                </div>
                            </div>

                            <hr/>

                            <div class="form-group">
                                <label class="control-label col-md-2 col-sm-1 col-xs-12">操作日</label>
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <span class="fa fa-calendar form-control-feedback left" aria-hidden="true" style="width: 40px"></span>
                                    <form:input type="date" path="holdDate" id="holdDate" class="form-control col-md-3 col-xs-12 has-feedback-left"  required="required"/>
                                </div>
                                <label class="control-label col-md-2 col-sm-2 col-xs-12">TOPに表示 </label>
                                <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                    <span class="fa fa-eye form-control-feedback left" aria-hidden="true" style="width: 40px"></span>
                                    <form:input path="sortScore" type="number" value="0" id="sortScore" class="form-control col-md-3 col-xs-12 has-feedback-left" required="required"/>
                                </div>
                            </div>

                            <hr/>

<%--                            <div class="form-group">--%>
<%--                                <label class="control-label col-md-2 col-sm-1 col-xs-12" >内容１ </label>--%>
<%--                                <div class="col-md-8 col-sm-1 col-xs-12">--%>
<%--                                    <form:input path="desc1" rows="5" class="form-control" id="desc1" type="hidden" required="required"/>--%>
<%--                                    <div class="x_content">--%>
<%--                                        <div id="alerts"></div>--%>
<%--                                        <div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor">--%>
<%--                                            <div class="btn-group">--%>
<%--                                                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>--%>
<%--                                                <ul class="dropdown-menu">--%>
<%--                                                </ul>--%>
<%--                                            </div>--%>

<%--                                            <div class="btn-group">--%>
<%--                                                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>--%>
<%--                                                <ul class="dropdown-menu">--%>
<%--                                                    <li>--%>
<%--                                                        <a data-edit="fontSize 5">--%>
<%--                                                            <p style="font-size:17px">Huge</p>--%>
<%--                                                        </a>--%>
<%--                                                    </li>--%>
<%--                                                    <li>--%>
<%--                                                        <a data-edit="fontSize 3">--%>
<%--                                                            <p style="font-size:14px">Normal</p>--%>
<%--                                                        </a>--%>
<%--                                                    </li>--%>
<%--                                                    <li>--%>
<%--                                                        <a data-edit="fontSize 1">--%>
<%--                                                            <p style="font-size:11px">Small</p>--%>
<%--                                                        </a>--%>
<%--                                                    </li>--%>
<%--                                                </ul>--%>
<%--                                            </div>--%>

<%--                                            <div class="btn-group">--%>
<%--                                                <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)" id="btn-bold"><i class="fa fa-bold" ></i></a>--%>
<%--                                                <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>--%>
<%--                                                <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>--%>
<%--                                                <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>--%>
<%--                                            </div>--%>

<%--                                            <div class="btn-group">--%>
<%--                                                <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>--%>
<%--                                                <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>--%>
<%--                                                <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>--%>
<%--                                                <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>--%>
<%--                                            </div>--%>

<%--                                            <div class="btn-group">--%>
<%--                                                <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>--%>
<%--                                                <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>--%>
<%--                                                <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>--%>
<%--                                                <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>--%>
<%--                                            </div>--%>

<%--                                            <div class="btn-group">--%>
<%--                                                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="fa fa-link"></i></a>--%>
<%--                                                <div class="dropdown-menu input-append">--%>
<%--                                                    <input class="span2" placeholder="URL" type="text" data-edit="createLink" />--%>
<%--                                                    <button class="btn" type="button">Add</button>--%>
<%--                                                </div>--%>
<%--                                                <a class="btn" data-edit="tel" title="Telephone"><i class="fa fa-phone"></i></a>--%>
<%--                                                <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="fa fa-cut"></i></a>--%>
<%--                                            </div>--%>

<%--                                                &lt;%&ndash;<div class="btn-group">&ndash;%&gt;--%>
<%--                                                &lt;%&ndash;<a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>&ndash;%&gt;--%>
<%--                                                &lt;%&ndash;<input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />&ndash;%&gt;--%>
<%--                                                &lt;%&ndash;</div>&ndash;%&gt;--%>

<%--                                            <div class="btn-group">--%>
<%--                                                <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>--%>
<%--                                                <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

<%--                                        <div id="editor" class="editor-wrapper placeholderText" contenteditable="true"></div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

                            <div class="form-group">
                                <label class="control-label col-md-2 col-sm-1 col-xs-12">コメント </label>
                                <div class="col-md-8 col-sm-1 col-xs-12">
                                    <form:input path="comment" rows="5" class="form-control" type="hidden" id="comment" required="required"/>
                                    <div class="x_content">
                                        <div id=""></div>
                                        <div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor2">
                                            <div class="btn-group">
                                                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
                                                <ul class="dropdown-menu">
                                                </ul>
                                            </div>

                                            <div class="btn-group">
                                                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <a data-edit="fontSize 5">
                                                            <p style="font-size:17px">Huge</p>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a data-edit="fontSize 3">
                                                            <p style="font-size:14px">Normal</p>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a data-edit="fontSize 1">
                                                            <p style="font-size:11px">Small</p>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="btn-group">
                                                <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)" id="btn-bold"><i class="fa fa-bold" ></i></a>
                                                <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
                                                <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
                                                <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
                                            </div>

                                            <div class="btn-group">
                                                <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
                                                <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
                                                <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
                                                <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
                                            </div>

                                            <div class="btn-group">
                                                <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
                                                <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
                                                <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
                                                <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
                                            </div>

                                            <div class="btn-group">
                                                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="fa fa-link"></i></a>
                                                <div class="dropdown-menu input-append">
                                                    <input class="span2" placeholder="URL" type="text" data-edit="createLink" />
                                                    <button class="btn" type="button">Add</button>
                                                </div>
                                                <a class="btn" data-edit="tel" title="Telephone"><i class="fa fa-phone"></i></a>
                                                <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="fa fa-cut"></i></a>
                                            </div>

                                                <%--<div class="btn-group">--%>
                                                <%--<a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>--%>
                                                <%--<input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />--%>
                                                <%--</div>--%>

                                            <div class="btn-group">
                                                <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
                                                <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
                                            </div>
                                        </div>

                                        <div id="editor2" class="editor-wrapper placeholderText" contenteditable="true"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2 col-sm-1 col-xs-12">抜粋</label>
                                <div class="col-md-8 col-sm-3 col-xs-12 form-group has-feedback">
                                    <span class="fa fa-user-md form-control-feedback left" aria-hidden="true"
                                          style="width: 40px"></span>
                                    <form:input path="excerpt" id="excerpt"
                                                class="form-control col-md-3 col-xs-12 has-feedback-left" required="required"/>
                                </div>
                            </div>

                            <hr/>

<%--                            <div class="item form-group">--%>
<%--                                <div>--%>
<%--                                    <label class="control-label col-md-2 col-sm-1 col-xs-12" for="publishStart">掲載開始日 </label>--%>
<%--                                    <div class="col-md-3 col-sm-3 col-xs-12">--%>
<%--                                        <form:input path="publishStart" type="date" id="publishStart" name="publishStart"--%>
<%--                                                    class="form-control col-md-7 col-xs-12"/>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div>--%>
<%--                                    <label class="control-label col-md-2 col-sm-2 col-xs-12" for="publishEnd">掲載終了日 </label>--%>
<%--                                    <div class="col-md-3 col-sm-3 col-xs-12">--%>
<%--                                        <form:input path="publishEnd" type="date" id="publishEnd" name="publishEnd"--%>
<%--                                                    class="form-control col-md-7 col-xs-12"/>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <hr/>--%>

<%--                            <div class="form-group">--%>
<%--                                <label class="control-label col-md-2 col-sm-1 col-xs-12">動画１</label>--%>
<%--                                <div class="col-md-8 col-sm-3 col-xs-12 form-group has-feedback">--%>
<%--                                    <span class="fa fa-user-md form-control-feedback left" aria-hidden="true"--%>
<%--                                          style="width: 40px"></span>--%>
<%--                                    <form:input path="videoUrl1"--%>
<%--                                                class="form-control col-md-3 col-xs-12 has-feedback-left"/>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <div class="col-md-3 col-sm-12 col-xs-12"></div>--%>
<%--                                <div class="col-md-6 col-sm-4 col-xs-12">--%>
<%--                                    <label class="col-md-5 col-sm-2 col-xs-12" for="picFile">一覧に表示する画像</label>--%>
<%--                                    <div class="col-md-7 col-sm-3 col-xs-12">解像度: 550 X 350</div>--%>
<%--                                    <div class="col-md-12 col-sm-7 col-xs-12 ">--%>
<%--                                        <form:input type="file" id="picFile" name="picFile" path="picFile" class="form-control col-md-3 col-xs-12"/>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label class="control-label col-md-2 col-sm-12 col-xs-12" for="picFile1">スター--%>
<%--                                    <span class="required">*</span></label>--%>
<%--                                <div class="col-md-8 col-sm-7 col-xs-12 ">--%>
<%--                                    <div class="col-md-12 col-sm-3 col-xs-12">解像度: 1100 X 700</div>--%>
<%--                                    <form:input type="file" id="picFile1" path="picFile1" required=""--%>
<%--                                                class="form-control col-md-3 col-xs-12" multiple="multiple"/>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label class="control-label col-md-2 col-sm-12 col-xs-12" for="picFile2">コメント--%>
<%--                                    <span class="required"></span></label>--%>
<%--                                <div class="col-md-8 col-sm-7 col-xs-12 ">--%>
<%--                                    <div class="col-md-12 col-sm-3 col-xs-12">解像度: 1100 X 700</div>--%>
<%--                                    <form:input type="file" id="picFile2" path="picFile2" required=""--%>
<%--                                                class="form-control col-md-3 col-xs-12" multiple="multiple"/>--%>
<%--                                </div>--%>
<%--                            </div>--%>

                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-12 col-sm-6 col-xs-12" align="center">
                                    <a class="btn btn-primary glyphicon glyphicon-remove" type="button"
                                       href="${pageContext.request.contextPath}/admin/event20/list/"
                                       aria-hidden="true">キャンセル
                                    </a>
                                    <button type="submit" class="btn btn-success">
                                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>登録
                                    </button>
                                </div>
                            </div>
                        </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
            <div class="pull-right">
                Japan Move Up West Admin
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
</div>
<div id="eventLoading" style="display: none" class="loading">
    <div class="loading-text">Processing...</div>
</div>

<!-- jQuery -->
<script src="/static/admin/vendors/jquery/dist/jquery.min.js"></script>
<!-- jquery validator -->
<script src="/static/admin/vendors/jquery-validation-1.17.0/dist/jquery.validate.min.js"></script>
<script src="/static/admin/vendors/jquery-validation-1.17.0/dist/localization/messages_ja.min.js"></script>
<!-- Bootstrap -->
<script src="/static/admin/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/static/admin/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="/static/admin/vendors/nprogress/nprogress.js"></script>
<!-- bootstrap-progressbar -->
<script src="/static/admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="/static/admin/vendors/iCheck/icheck.min.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="/static/admin/vendors/moment/min/moment.min.js"></script>
<script src="/static/admin/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap-wysiwyg -->
<script src="/static/admin/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
<script src="/static/admin/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
<script src="/static/admin/vendors/google-code-prettify/src/prettify.js"></script>
<!-- jQuery Tags Input -->
<script src="/static/admin/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
<!-- Switchery -->
<script src="/static/admin/vendors/switchery/dist/switchery.min.js"></script>
<!-- Select2 -->
<script src="/static/admin/vendors/select2/dist/js/select2.full.min.js"></script>
<!-- Parsley -->
<script src="/static/admin/vendors/parsleyjs/dist/parsley.min.js"></script>
<!-- Autosize -->
<script src="/static/admin/vendors/autosize/dist/autosize.min.js"></script>
<!-- jQuery autocomplete -->
<script src="/static/admin/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
<!-- starrr -->
<script src="/static/admin/vendors/starrr/dist/starrr.js"></script>
<!-- Custom Theme Scripts -->
<script src="/static/admin/build/js/custom.min.js"></script>
<!-- Datatables -->
<script src="/static/admin/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/static/admin/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="/static/admin/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="/static/admin/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="/static/admin/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="/static/admin/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="/static/admin/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="/static/admin/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="/static/admin/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="/static/admin/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="/static/admin/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="/static/admin/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
<script src="/static/admin/vendors/jszip/dist/jszip.min.js"></script>
<script src="/static/admin/vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="/static/admin/vendors/pdfmake/build/vfs_fonts.js"></script>

<!-- bootstrap-fileinput -->
<script src="/static/admin/vendors/bootstrap-fileinput/js/fileinput.js"></script>
<script src="/static/admin/vendors/bootstrap-fileinput/js/locales/ja.js"></script>

<script>
    $('#picFile').fileinput({'language':'ja', 'showClose': true, 'showRemove':false, 'showUpload':false, 'previewFileType':'any', 'autoReplace':true,"minImageWidth":550,"maxImageWidth":550,"minImageHeight":350,"maxImageHeight":350
        <c:if test="${eventRegistForm.picUrl != null && eventRegistForm.picUrl != ''}">
        , 'uploadUrl':null, 'initialPreview': [
            "<img src='${eventRegistForm.picUrl}' class='file-preview-image kv-preview-data' stype='width:auto;height:auto;max-width:100%;max-height:100%;' alt='Desert' title='Desert'>"
        ]
        </c:if>
    });
    $('#picFile1').fileinput({
        'language':'ja', 'showClose': true, 'showRemove':false, 'showUpload': false, 'previewFileType': 'any',"minImageWidth":1100,"maxImageWidth":1100,"minImageHeight":700,"maxImageHeight":700
    })
    $('#picFile2').fileinput({
        'language':'ja', 'showClose': true, 'showRemove':false, 'showUpload': false, 'previewFileType': 'any',"minImageWidth":1100,"maxImageWidth":1100,"minImageHeight":700,"maxImageHeight":700
    })



    function onRegist() {
        $('#eventLoading').show();
        return true;
    }

    var $userForm = $("#userForm");
    $userForm.validate({
        submitHandler: function(form) {
            $("#desc1").val($('#editor').html());
            $("#comment").val($('#editor2').html());
            $('#eventLoading').show();
            $(form).submit();
        },
        errorClass : "validatorError",
        rules : {
            title :{
                required: true,
                maxlength: 60
            },
            gustName :{
                required: true,
                maxlength: 255
            },
            hallName :{
                required: true,
                maxlength: 255
            },
            holdDate :{
                required: true
            },
            sortScore :{
                digits: true,
                required: true,
                maxlength: 4
            },
            desc1 :{
                required: true,
                maxlength: 2048
            },
            comment :{
                required: true,
                maxlength: 2048
            },
            excerpt :{
                required: true,
                maxlength: 255
            },
            videoUrl1 :{
                url: true,
                maxlength: 255
            },
            picFile :{
                required: true
            },
            picFile1 :{
                required: true
            }
        }
    });

    $('#editor').html($("#desc1").val());
    $('#editor2').html($("#comment").val());
</script>

<script>
    function initToolbarBootstrapBindings() {
        var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
                'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
                'Times New Roman', 'Verdana'],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
        $.each(fonts, function (idx, fontName) {
            fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
        });
    };
    initToolbarBootstrapBindings();
</script>
</body>
</html>

