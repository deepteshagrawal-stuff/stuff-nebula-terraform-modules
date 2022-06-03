import os
from os.path import basename
from zipfile import ZipFile
modules_directory = './modules'
zip_directory = './zips'
    
def main():
    os.mkdir(zip_directory)
    #Iterate modules directory
    for foldername in os.listdir(modules_directory):
        folder = str(os.path.join(modules_directory, foldername))
        version_file = folder + "/versions.txt"
        if os.path.isfile(version_file):
            past_versions = []
            next_version = ""
            with open(version_file) as f:
                line = f.readline()
                past_versions = line.strip().split(" ")
                next_version = f.readline()
                print(past_versions)
                print(next_version)
                if not next_version == "":
                    if not next_version in past_versions:
                        print("Adding new Version")
                    else:
                        print("New version already exists! Please update new version to unique version id!")
                else: 
                    print("No new version declared. Moving to next module!")
            f.close()

def create_zip(folder, next_version):
    zip_module_dir = os.path.join(zip_directory, basename(folder))
    print(zip_module_dir)
    next_version_zip_file = zip_module_dir+"/"+next_version+".zip"
    os.mkdir(zip_module_dir)
    with ZipFile(next_version_zip_file, 'w') as zipObj:
        for file in folder:
            print(file)
            print(folder)
            filePath = os.path.join(folder, file)
            zipObj.write(file, basename(filePath))

if __name__ == "__main__":
    main()