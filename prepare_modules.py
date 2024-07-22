import json
import os
import json
from os.path import basename
from zipfile import ZipFile

modules_dir = './modules'
zip_dir = './zips'

def main():
    print("Inside main function")
    if os.path.exists(zip_dir):
        print("Zips director exists - removing zips directory")
        os.system("rm -rf " + zip_dir)
    os.mkdir(zip_dir)
    #Iterate modules directory
    for module in os.listdir(modules_dir):
        try:
            print("Analysing Module: " + module)
            module_dir = str(os.path.join(modules_dir, module))
            version_file = module_dir + "/version-history.json"
            if os.path.isfile(version_file):
                # Loads version file
                with open(version_file, "r") as f:
                    data = json.load(f)
                f.close()
                # Ensures version set for this release is not included in past versions
                if not data["current-version"] in data["versions"] and not data["current-version"] == "":
                    print(module + ": release version set... preparing for release...")
                    current_version = data["current-version"]
                    module_zip_dir = os.path.join(zip_dir, module)
                    os.mkdir(module_zip_dir)
                    zip_folder(current_version, module_dir, module_zip_dir)
                    print(module + ": Zippped successfully...")
                    update_versions_file(version_file, data)
                    print(module + ": Version file updated! New version: " + current_version)
                else:
                    print(module + ":No version set or the version already exists!")
            else:
                print(module + ": No version file!")
        except Exception as e:
            print(f"unexpection exception in main: {e}")

# Zips folder for release to Amazon s3
def zip_folder(current_version, module_dir, module_zip_dir):
    try:
        file_name = current_version+".zip"
        zip_file = os.path.join(module_zip_dir,file_name)
        with ZipFile(zip_file, 'w') as zipObj:
            print(f"Created ZIP file path: {zip_file}")
            for folderName, subFolders, fileNames in os.walk(module_dir):
                print(f"folderName: {folderName}")
                for fileName in fileNames:
                    if(fileName.endswith(".tf")):
                        filePath = os.path.join(folderName, fileName)
                        print(f"filePath: {filePath}")
                        arcname = os.path.relpath(filePath, module_dir)
                        print(f"relative file name: {arcname}")
                        zipObj.write(filePath, arcname)
    except Exception as e:
        print(f"zipping folder exception: {e}")

# Modifys the version=history.json to include new version as a version
def update_versions_file(version_file, data):
    try:
        data["versions"].append(data["current-version"])
        data["current-version"] = ""
        with open(version_file, "w") as f:
            json.dump(data, f, indent=4)
        f.close()
    except Exception as e:
        print(f"update versions file exception: {e}")

if __name__ == "__main__":
    try:
        print("calling main")
        main()
    except Exception as e:
        print(f"exception while calling main: {e}")