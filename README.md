# upload-to-s3_bucket

Upload/update build file data to S3 bucket. There is a condition when the local build folder name matches with S3-bucket folder name, thenthe  data will be uploaded/updated. 
----------------------------------------------------------------------------------------------------------------------

There is data upload/update on multiple(three) S3 buckets 

>    s3://archbridge-capital-uat-beta/                          #root
>   s3://archbridge-capital-uat-beta/arch-bridge-uat/          # /arch-bridge-uat
>   s3://archbridge-capital-uat-beta/uc/                       # /uc
