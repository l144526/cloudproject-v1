<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="cloudproject.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="icon" href="images/logo/favicon-196x196.png">
    <title>Signin Template for Bootstrap</title>
    <!-- Bootstrap core CSS -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="Css/custom.css" rel="stylesheet" />
</head>
<body  class="text-center">



    <!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->

    <!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->




    <form class="form-signin" runat="server">

        <asp:Label ID="fb_name_" runat="server" />
        <asp:Label ID="fb_email_" runat="server" />
        <img class="mb-4" src="images/logo/hover_logo.svg" alt="" height="65">

        <label for="inputEmail" class="sr-only">Email address</label>
        <asp:TextBox runat="server" type="email" ID="inputEmail" CssClass="form-control" placeholder="Email address" autofocus="true" />

        <label for="inputPassword" class="sr-only">Password</label>

        <asp:TextBox runat="server" type="password" ID="inputPassword" CssClass="form-control" placeholder="Password" />
        <div class="checkbox mb-3">
        </div>
        <asp:Button runat="server" CssClass="btn btn-lg btn-primary btn-block" type="submit" Text="Login" OnClick="Login_Click" />

        <fb:login-button scope="public_profile,email" onlogin="checkLoginState();" style="padding-top:30px"></fb:login-button>

 

        <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
    </form>
    <script>
      
        // This is called with the results from from FB.getLoginStatus().
        function statusChangeCallback(response) {
            
            console.log('statusChangeCallback');
            console.log(response);
            // The response object is returned with a status field that lets the
            // app know the current login status of the person.
            // Full docs on the response object can be found in the documentation
            // for FB.getLoginStatus().
            if (response.status === 'connected') {
                // Logged into your app and Facebook.
                testAPI();
            } else {
                // The person is not logged into your app or we are unable to tell.
                document.getElementById('status').innerHTML = 'Please log ' +
                    'into this app.';
            }
        }

        // This function is called when someone finishes with the Login
        // Button.  See the onlogin handler attached to it in the sample
        // code below.
        function checkLoginState() {
            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });
        }

        window.fbAsyncInit = function () {
            FB.init({
                appId: '2248553955427606',
                cookie: true,  // enable cookies to allow the server to access 
                // the session
                xfbml: true,  // parse social plugins on this page
                version: 'v2.8' // use graph api version 2.8
            });

            // Now that we've initialized the JavaScript SDK, we call 
            // FB.getLoginStatus().  This function gets the state of the
            // person visiting this page and can return one of three states to
            // the callback you provide.  They can be:
            //
            // 1. Logged into your app ('connected')
            // 2. Logged into Facebook, but not your app ('not_authorized')
            // 3. Not logged into Facebook and can't tell if they are logged into
            //    your app or not.
            //
            // These three cases are handled in the callback function.

            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });

        };

        // Load the SDK asynchronously
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        FB.logout(function(response) {
   // Person is now logged out
});
        // Here we run a very simple test of the Graph API after login is
        // successful.  See statusChangeCallback() for when this call is made.
        function testAPI() {
            console.log('Welcome!  Fetching your information.... ');
            FB.api('/me', { locale: 'en_US', fields: 'name, email' },
                function (response) {
                    console.log('Successful login for: ' + response.name);
                    document.getElementById("fb_name_").value = response.name;
                    document.getElementById("fb_email_").value = response.email;
                    var str = response.name;
                    var replaced = str.split(' ').join('+');
                    window.location = "https://hover.azurewebsites.net/Redirect.aspx?email=" + response.email + "&name=" + replaced;
                });
        }
    </script>
</body>
</html>
