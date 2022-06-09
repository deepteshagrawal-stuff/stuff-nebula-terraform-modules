export BUCKET_NAME=$(terraform output -raw bucket_id)
if [ -d ./zips/* ]; then 
    for module in ./zips/*; do
        for version in ./zips/$(basename $module)/*; do
            aws s3 cp ./zips/$(basename $module)/* s3://$BUCKET_NAME/$(basename $module)/$(basename $version)
        done
    done
else 
    echo "No modules to upload!"
fi