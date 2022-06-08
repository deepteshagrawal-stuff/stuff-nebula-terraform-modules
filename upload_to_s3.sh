export BUCKET_NAME=$(terraform output bucket_id)
for module in ./zips/*; do
    for version in ./zips/$(basename $module)/*; do
        aws s3 cp ./zips/$(basename $module)/* s3://$BUCKET_NAME/$(basename $module)/$(basename $version)
    done
done