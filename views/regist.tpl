<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link href="/static/css/bootstrap.css" rel="stylesheet" />
    <link href="/static/css/style.css" rel="stylesheet" />

    <script type="text/javascript" src="/static/js/lib/jquery.js"></script>
    <script type="text/javascript" src="/static/js/lib/jquery.cookies.js"></script>
    <script type="text/javascript" src="/static/js/lib/underscore.js"></script>
    <script type="text/javascript" src="/static/js/lib/md5.js"></script>
    <script type="text/javascript" src="/static/js/lib/bootstrap.js"></script>
    <script type="text/javascript" src="/static/js/lib/common.js"></script>
    <script type="text/javascript" src="/static/js/lib/validator.js"></script>
    <style type="text/css">
        body {height: 100%; background-color: rgb(66, 139, 202);}
        #createUserModal {margin-top:80px;}
    </style>

</head>
<body >
{{template "/header.tpl" .}}
<div class="wrap" style="position:fixed;left:0;right:0;top:0;bottom:50px;margin:auto;overflow:auto; z-index: 3">
    <script>
        $(function() {
            validator.bind('#loginForm');
        })
        window.onkeydown = function(e) {
            var e = e || window.event;
            if(e.keyCode == 13) regist($('#loginBtn'));
        }

        function regist(obj) {
            if(!validator.validateAll('#loginForm'))
                return false;

            var name = $('#txtName').val() || '';
            var password =$('#txtPwd').val() || '';

            if(name.trim() == "" || password.trim() == "") return false;
            $('#loginBtn').attr('disabled', 'disabled');

            $.post("/regist", {name : name, password: password}, function(json) {
                $('#loginBtn').removeAttr('disabled');
                if(!json || json.status != "success") return common.popBy(obj, json.message);
                location.href="/workOvertime/v?uid=" + json.result.id;
            })
        }
    </script>

    <div class="container fixed-width center-block" id="createUserModal">
        <div class="well center-block" id="loginPanel">
            <p class="text-center" id="loginLogo">XISUE</p>
            <form class="form-horizontal" id="loginForm" >
                <div class="form-group">
                    <label for="nameTxt" class="col-xs-3 control-label">用户名</label>
                    <div class="col-xs-6">
                        <input type="text" name="name" class="form-control validator" validator="strLen" id="txtName" description="名称" required='required' placeholder="请输入用户名或者邮箱" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="passwordTxt" class="col-xs-3 control-label">密码</label>
                    <div class="col-xs-6">
                        <input type="password" name="password" class="form-control validator" validator="password" id="txtPwd" description="密码" required='required' placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-6 col-xs-offset-3">
                        <button class="btn btn-primary col-xs-12 " id="loginBtn" onclick="regist(this)" type="button">注册</button>
                    </div>
                </div>
                <div class="alert alert-danger errorInfo" role="alert">

                </div>
                <script>
                    (function() {
                        if($('.errorInfo').html().trim()) $('.errorInfo').show();
                        else $('.errorInfo').hide();
                    })()
                </script>
            </form>
        </div>
    </div>

</div>
{{template "/footer.tpl" .}}
</body>





