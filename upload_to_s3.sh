export BUCKET_NAME=stuff-terraform-nebula-modules
for d in ./zips/*; do
    for z in ./zips/$(basename $d)/*; do
        aws s3 cp ./zips/$(basename $d)/* s3://$BUCKET_NAME/$(basename $d)/$(basename $z)
    done
done



# version=1.0.1
# export BUCKET_NAME=stuff-terraform-nebula-modules
# echo $BUCKET_NAME
# rm -r ./zips
# mkdir zips

# function version_exists() {
#     for version in "${past_versions[@]}"
#     do
#         echo "$version and $next_version"
#         if [ $version == $next_version ]
#         then
#             echo "They are the same"
#             return 0
#         fi   
#     done
#     return 1
# } 

# for d in ./modules/*; do

#     # testing=$($d/versions.sh)
#     # echo $testing
#     # version=$(cat $d/version)
#     mkdir ./zips/$(basename $d)
#     zip ./zips/$(basename $d)/$version.zip $d
#     # aws s3 cp ./zips/$(basename $d)/* s3://$BUCKET_NAME/$(basename $d)/$version
# done

# for d in ./zips/*; do
#     echo $d
#     # aws s3 cp $d/* s3://$BUCKET_NAME/$(basename 
# done



# version_exists
# echo $?
# past_versions+=("$next_version")
# version_exists
# echo $?

# echo ${past_versions[-1]}