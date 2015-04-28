#!/bin/sh
source config.sh
git diff-index --quiet HEAD
#   if [ $? -ne 0 ]; then
#       echo Working directory dirty!
#       echo Did you set the baseUrl in config.yaml?
#       exit 1
#   fi

if [ "$hugo_gallery_domain" == "" ]; then
    echo "Missing configuration values"
    exit 1
fi

echo "Uploading to Domain $hugo_gallery_domain"

echo "CSS"
s3cmd sync public/css/ s3://$hugo_gallery_domain/css/

echo "IMAGES"
s3cmd sync public/images/ s3://$hugo_gallery_domain/images/

echo "GRAPHICS"
s3cmd sync public/graphics/ s3://$hugo_gallery_domain/graphics/

echo "FONTS"
s3cmd sync public/fonts/ s3://$hugo_gallery_domain/fonts/
