<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
</head>
<body>
    <content tag="nav">

        <div id="controllers" role="navigation">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Menus <span class="caret"></span></a>
                <ul class="dropdown-menu">

                    <li class="controller">
                        <a href="/projet/annonce/index">Annonce</a>
                    </li>

                    <li class="controller">
                        <a href="/projet/illustration/index">Illustration</a>
                    </li>

                    <li class="controller">
                        <a href="/projet/user/index">User</a>
                    </li>

                    <li class="controller">
                        <a href="/projet/login/index">Login</a>
                    </li>

                    <li class="controller">
                        <a href="/projet/logout/index">Logout</a>
                    </li>

                </ul>
            </li>
        </div>

    </content>

    <div class="svg" role="presentation">
        <div class="grails-logo-container">
            <asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>
        </div>
    </div>

    <div id="content" role="main">
        <section class="row colset-2-its">
            <h1>Welcome to Grails</h1>

            <p>
                Congratulations, you have successfully started your first Grails application! At the moment
                this is the default page, feel free to modify it to either redirect to a controller or display
                whatever content you may choose. Below is a list of controllers that are currently deployed in
                this application, click on each to execute its default action:
            </p>

        </section>
    </div>

</body>
</html>
