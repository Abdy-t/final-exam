<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <title>Вход в систему</title>
    <link rel="stylesheet" href="/css/login.css">

</head>

<body>
<div class="wrapper fadeInDown">
    <div id="formContent">
        <h2>ABC System</h2>
        <form action="/login" method="post">
            <div style="margin: 1rem">
                <#if error!false >
                    <p style="color:#fd7777"><strong>Неверный email или пароль!</strong></p>
                </#if>
            </div>
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
            </#if>
            <input type="email" id="login" class="fadeIn second" name="username" placeholder="email" required>
            <input type="password" id="password" class="fadeIn third pwd" name="password" placeholder="пароль" required>
            <span class="input-group-btn" style="display: inline">
                <button class="btn btn-default reveal" type="button" style="padding: 14px 11px; margin-bottom: 2px; margin-left: -44px">
                    <i class="glyphicon glyphicon-eye-open"></i>
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
            <input type="submit" class="fadeIn fourth" value="Войти">
        </form>
        <div id="formFooter">
            <a class="underlineHover" href="/registration">Регистрация</a>
        </div>
    </div>
</div>

</body>

</html>
