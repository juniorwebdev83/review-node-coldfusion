<!-- Application.cfc -->
<cfcomponent>

    <cfset this.name = "YourApplicationName12">
    <cfset this.applicationTimeout = createTimeSpan(0, 0, 20, 0)>
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimeSpan(0, 0, 20, 0)>

    <cffunction name="OnApplicationStart" access="public" output="true">
        <cfset application.mongoConnectionString = "mongodb://localhost:27017/?retryWrites=true&w=majority">
    </cffunction>

    <cffunction name="onError" returnType="void" output="true" access="public">
        <cfdump var="#arguments#" abort>
    </cffunction>

</cfcomponent>
