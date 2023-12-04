// server.js
import express from 'express';
import { v2 as cloudinary } from 'cloudinary';
import multer from 'multer';
import fs from 'fs';

cloudinary.config({ 
  cloud_name: 'review-site', 
  api_key: '943693391396375', 
  api_secret: 'MgLL35GMgJetRLaKr-Qhx45tqsM' 
});

const app = express();
const PORT = process.env.PORT || 3000;

// Set up Multer for handling file uploads
const storage = multer.memoryStorage(); // Store files in memory
const upload = multer({ storage: storage });

// Middleware to parse JSON and urlencoded request bodies
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
  res.send('Hello, this is your Express server!');
});

// Route to handle image upload
app.post('/upload', upload.single('image'), async (req, res) => {
  try {
    // Assuming you have a form field named 'image' for the file upload
    const imageFile = req.file;

    // Create a temporary file with the buffer
    const tempFilePath = './temp_image.jpg'; // Adjust the file extension accordingly
    fs.writeFileSync(tempFilePath, imageFile.buffer);

    // Upload the temporary file to Cloudinary
    const result = await cloudinary.uploader.upload(tempFilePath, {
      folder: 'your-cloudinary-folder', // Replace with your desired folder
      public_id: 'unique_identifier_for_image', // Set a unique identifier for the image
    });

    // Remove the temporary file
    fs.unlinkSync(tempFilePath);

    // Log the Cloudinary result
    console.log('Cloudinary Upload Result:', result);

    // Send back the Cloudinary URL
    res.send(`Image URL: ${result.url}`);
  } catch (error) {
    console.error('Error:', error);
    res.status(500).send('Internal Server Error');
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
