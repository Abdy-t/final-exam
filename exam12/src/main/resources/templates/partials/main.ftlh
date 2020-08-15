<#macro renderWith title="Cafe Critic" scripts=[] styles=["css/main.css"]>
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
        <style>

        </style>
        <title>${title}</title>

        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="font-awesome/css/all.min.css">
        <#list styles as styleSource>
            <link rel="stylesheet" href="${styleSource}">
        </#list>
    </head>
    <body>
    <header class="header">

        <div class="container m-auto p-0">
            <nav class="navbar navbar-expand-lg bg-dark my-2">
                <a class="navbar-brand text-uppercase link-logo" href="/"><b>Cafes</b></a>


                <form class="form-inline">
                    <input class="form-control mr-sm-2" type="search" placeholder="Поиск" aria-label="Search">
                    <button class="btn-su my-2 my-sm-0" type="submit">Поиск</button>
                </form>


                <#if user??>

                    <a href="/addCafe" type="button" class="btn-su ml-auto mr-2 ">Добавить заведение</a>
                    <form action="/logout" method="post" class="d-flex">
                        <#if _csrf??>
                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                                   value="${(_csrf.token)!'--no-token--'}"/>
                        </#if>
                        <button type="submit" class="btn btn-su">Выйти</button>
                    </form>
                <#else >
                    <a href="/login" type="button" class="btn-su ml-auto mr-2">
                        Вход
                    </a>
                    <a href="/registration" type="button" class="btn-su ml-2" >
                        Регистрация
                    </a>
                </#if>
            </nav>

        </div>
    </header>
    <#--
    например если бы у нашего сайта было какое-то верхнее меню,
    то мы могли бы его тут указать
    и оно появится сразу на всех страницах которые используют
    этот шаблон
    -->

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>

    <#list scripts as scriptSource>
        <script src="${scriptSource}"></script>
    </#list>

    <div class="container text-center">
        <#nested>
    </div>


    <footer class="footer">
        <div class="container py-3 my-0">
            <p class="pt-2">© Footer Info</p>
        </div>
    </footer>


    </body>
    </html>

</#macro>
