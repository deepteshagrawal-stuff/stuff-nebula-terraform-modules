export BUCKET_NAME=$(terraform output -raw bucket_id)
echo "Zip Directory:"
echo "$(ls zips/*/*)"
for module in ./zips/*; do
    for version in ./zips/$(basename $module)/*; do
        aws s3 cp ./zips/$(basename $module)/* s3://$BUCKET_NAME/$(basename $module)/$(basename $version)
    done
done
echo "Finished uploading available directorys"