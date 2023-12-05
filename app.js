// app.js
const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const userController = require('./users/userController');
const uploadRoutes = require('./uploadRoutes');

require('dotenv').config(); // Add this line

const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.json());
console.log('MONGODB_URI:', process.env.MONGODB_URI);

mongoose.connect(process.env.MONGODB_URI, );

// Registration route
app.post('/register', async (req, res) => {
  const { email, password, profileImage } = req.body;
  userController.registerUser(email, password, profileImage);
  res.status(200).json({ success: true, message: 'User registered successfully.' });
});

// Use the new upload route
app.use('/upload', uploadRoutes);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
