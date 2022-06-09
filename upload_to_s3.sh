export BUCKET_NAME=$(terraform output -raw bucket_id)
if [ -d ./zips/* ]; then 
    for module in ./zips/*; do
        # Add check for if this folder exists
        for version in ./zips/$(basename $module)/*; do
            # aws s3 cp ./zips/$(basename $module)/* s3://$BUCKET_NAME/$(basename $module)/$(basename $version)
            echo ./zips/$(basename $module)
        done
    done
fi