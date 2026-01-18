import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter/material.dart';

class CloudinaryService {
  static void init() {
    CloudinaryContext.cloudinary = Cloudinary.fromCloudName(cloudName: 'demo');
  }

  static CldImageWidget buildImage(String publicId, {double? width, double? height, BoxFit? fit}) {
    return CldImageWidget(
      publicId: publicId,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      // You can add transformations here implicitly or via the builder
    );
  }
}
