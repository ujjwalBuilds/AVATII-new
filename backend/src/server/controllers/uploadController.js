import cloudinary from '../config/cloudinary.js';
import fs from 'fs';

// export const uploadImage = async (req, res) => {
//   try {
//     const file = req.file.path;

//     const result = await cloudinary.uploader.upload(file, {
//       folder: 'uploads',
//     });

//     fs.unlinkSync(file); // Delete file after upload to Cloudinary

//     res.status(201).json({imageUrl: result.secure_url });
//   } catch (error) {
//     res.status(500).json({ success: false, message: error.message });
//   }
// };
export const uploadImage = async (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ message: 'No file uploaded' });
    }

    const imageUrl = req.file.path;
    res.status(200).json({ imageUrl });
  } catch (error) {
    res.status(500).json({ message: 'Error uploading image', error: error.message });
  }
};