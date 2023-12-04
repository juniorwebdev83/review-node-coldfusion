<cfif session.keyexists('userLoggedIn') and session.userLoggedIn>
    <cflocation url="dashboard.cfm">
</cfif>

<!-- Forms/loginForm.cfm -->
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Include your head section (meta tags, title, styles, etc.) -->
</head>
<body>

<div class="container">
    <h2>Login</h2>

    <cfif session.keyexists('flashMessage') and len(session.flashMessage)>
        <cfoutput>#session.flashMessage#<hr></cfoutput>
    </cfif>

    <form action="login.cfm" method="post">

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>
