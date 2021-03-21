<%--
  Created by IntelliJ IDEA.
  User: kom
  Date: 3/18/2021
  Time: 8:45 PM
--%>

<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
<asset:stylesheet src="application.css"/>
<asset:stylesheet src="all.min.css"/>
<asset:stylesheet src="sb-admin-2.min.css"/>
<link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
</head>
<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block "></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                </div>
                                <form action="/projet/login/authenticate" method="POST" id="loginForm" class="cssform" autocomplete="off">
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" name="username" id="username" placeholder="Username">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user" name="password" id="password" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox small">
                                            <input type="checkbox" class="custom-control-input" name="remember-me" id="remember_me">
                                            <label class="custom-control-label" for="remember_me">Remember
                                            Me</label>
                                        </div>
                                    </div>
                                    <input class="btn btn-primary btn-user btn-block" type="submit" id="submit" value="Login">
                                    <script>
                                        (function() {
                                            document.forms['loginForm'].elements['username'].focus();
                                        })();
                                    </script>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>

%{--<!-- Bootstrap core JavaScript-->--}%
%{--<script src="vendor/jquery/jquery.min.js"></script>--}%
%{--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--}%

%{--<!-- Core plugin JavaScript-->--}%
%{--<script src="vendor/jquery-easing/jquery.easing.min.js"></script>--}%

%{--<!-- Custom scripts for all pages-->--}%
%{--<script src="js/sb-admin-2.min.js"></script>--}%

</body>
</html>