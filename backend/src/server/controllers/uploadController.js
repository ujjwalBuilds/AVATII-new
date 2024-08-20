import cloudinary from '../config/cloudinary.js';
import fs from 'fs';

export const uploadImage = async (req, res) => {
  try {
    const file = req.file.path;

    const result = await cloudinary.uploader.upload(file, {
      folder: 'uploads',
    });

    fs.unlinkSync(file); // Delete file after upload to Cloudinary

    res.status(201).json({imageUrl: result.secure_url });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
};
