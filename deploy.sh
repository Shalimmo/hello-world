#!/bin/bash
#---------------------------------------------------------
# written by: Lawrence McDaniel
#             lpm0073@gmail.com
#             lawrencemcdaniel.com
#
# date:       May-2020
#
# usage:      deploy prouduction build of react.shalimmora.com
#             app to AWS S3 bucket.
#
#             https://gist.github.com/kellyrmilligan/e242d3dc743105fe91a83cc933ee1314
# 
#             1. Build the React application
#             2. Upload to AWS S3
#             3. Invalidate all items in the AWS Cloudfront CDN.
#---------------------------------------------------------
echo "Building app"
cd /Users/shalim/github/hello-world/hello-world/
##npm update -g
##npm run sitemap
yarn build

# ------------------------
# add all built files to the S3 bucket.
# ------------------------
echo "copy production build to AWS S3"
aws s3 sync ./build/ s3://react.shalimmora.com/build/ \
            --acl public-read \
            --delete --cache-control max-age=31536000,public \
            --expires '31 Dec 2050 00:00:01 GMT'

# ------------------------
# remove the cache-control header created above with a "no-cache" header so that browsers never cache this page
# ------------------------
echo "invalidate AWS S3 cache"
aws s3 cp s3://react.shalimmora.com/service-worker.js s3://react.shalimmora.com/service-worker.js --metadata-directive REPLACE --cache-control max-age=0,no-cache,no-store,must-revalidate --content-type application/javascript --acl public-read
aws s3 cp s3://react.shalimmora.com/index.html s3://react.shalimmora.com/index.html --metadata-directive REPLACE --cache-control max-age=0,no-cache,no-store,must-revalidate --content-type text/html --acl public-read
aws s3 cp s3://react.shalimmora.com/sitemap.xml s3://react.shalimmora.com/sitemap.xml --metadata-directive REPLACE --cache-control max-age=0,no-cache,no-store,must-revalidate --content-type text/html --acl public-read

# invalidate the Cloudfront cache
echo "invalidate AWS Cloudfront cache"
aws cloudfront create-invalidation \
              --distribution-id E2V0D5Y01UUBZ \
              --paths "/*" "/index.html" "/sitemap.xml"