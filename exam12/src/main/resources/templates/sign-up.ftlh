<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="/css/login.css">

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

    <title>Регистрация в систему</title>
</head>

<body>
<div class="wrapper fadeInDown">
    <div id="formContent">
        <h2>Регистрация</h2>
        <form action="/registration" method="post" id="myform">
            <div style="margin: 1rem">
                <#if errors?? >
                    <strong> <p>Входные данные с ошибками!</p></strong>
                    <#list errors as fieldError>
                        <strong><p style="color:#fd7777">${fieldError.defaultMessage!'-- no message --'}</p></strong>
                    </#list>
                </#if>
                <#if errorEmail?? >
                    <strong><p style="color:#fd7777">Пользователь с таким адресом почты уже зарегистрован!</p></strong>
                </#if>
            </div>
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
            </#if>
            <input type="email" id="email" class="fadeIn third" name="email" placeholder="email" required>
            <input type="text" id="name" class="fadeIn third" name="name" placeholder="имя" required>
            <input type="password" id="password" class="fadeIn third pwd" name="password" placeholder="пароль">
            <span class="input-group-btn">
                <button class="btn btn-default reveal" type="button" style="padding-left: 50px; padding-right: 50px">
                    <i class="glyphicon glyphicon-eye-open" style="font-size: 20px"></i>
                </button>
            </span>
            <script>
                $(".reveal").on('click',function() {
                    let $pwd = $(".pwd");
                    if ($pwd.attr('type') === 'password') {
                        $pwd.attr('type', 'text');
                    } else {
                        $pwd.attr('type', 'password');
                    }
                });
            </script>
            <input type="submit" class="fadeIn fourth" value="Зарегистрировать">
        </form>
    </div>

</div>

</body>

</html>
