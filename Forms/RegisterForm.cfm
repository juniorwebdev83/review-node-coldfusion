<!-- Forms/RegisterForm.cfm -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>

    </style>
</head>
<body>

<div class="review-banner">
    Register
</div>

<form action="register.cfm" method="post" enctype="multipart/form-data">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>

    <label for="image">Profile Image:</label>
    <input type="file" id="image" name="image" accept="image/*">

    <button type="submit">Register</button>
</form>

</body>
</html>
