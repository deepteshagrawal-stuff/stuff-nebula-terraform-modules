# export BUCKET_NAME=$(terraform output -raw bucket_id)
echo "$(ls zips)"
echo "$(ls zips/*)"
echo "$(ls zips/*/*)"
if [ -d ./zips/* ]; then 
    for module in ./zips/*; do
        # echo "Module found : $module"
        for version in ./zips/$(basename $module)/*; do
            # echo "Version of $module found: $version"
            aws s3 cp ./zips/$(basename $module)/* s3://$BUCKET_NAME/$(basename $module)/$(basename $version)
        done
    done
else 
    echo "No modules to upload!"
fi