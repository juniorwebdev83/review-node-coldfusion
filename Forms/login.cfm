<!-- login.cfm -->
<cfoutput>
    <cfparam name="form.email" default="">
    <cfparam name="form.password" default="">

    <cfset userCFC = createObject('component', 'user')>

    <cfif structKeyExists(form, 'email') and structKeyExists(form, 'password')>
        <!-- Form submitted, process login -->
        <cfset email = form.email>
        <cfset password = form.password>

        <cfif userCFC.loginUser(email, password)>
            <!-- Login successful -->
            <cfset session.userLoggedIn = true>
            <cfset session.userEmail = email>

            <cflocation url="dashboard.cfm">
        <cfelse>
            <cfset session.flashMessage = "Error: Invalid email or password.">
            <cflocation url="loginForm.cfm">
        </cfif>
    <cfelse>
        <!-- Display the login form -->
        <cfinclude template="loginForm.cfm">
    </cfif>
</cfoutput>
