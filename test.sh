echo $BUCKET_NAME

for d in ./modules/*; do
    echo $d
    zip ./zips/$d.zip $d
done

for d in ./zips/*; do
    echo $d
done
