# upload-to-s3_bucket

Upload/update build file data to s3 bucket there is conditon when local build folder name match with s3-bucket folder name then data will uplaod/update. 
----------------------------------------------------------------------------------------------------------------------

There is data upload/update on multiple(three) s3-bucket 
'''
    s3://archbridge-capital-uat-beta/                          #root
    s3://archbridge-capital-uat-beta/arch-bridge-uat/          # /arch-bridge-uat
    s3://archbridge-capital-uat-beta/uc/                       # /uc
'''