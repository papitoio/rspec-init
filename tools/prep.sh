apt-get update; apt-get install unzip default-jre -y 
wget https://bintray.com/qameta/generic/download_file?file_path=io%2Fqameta%2Fallure%2Fallure%2F2.7.0%2Fallure-2.7.0.zip
if [ -d allure-2.7.0 ]; then rmdir allure-2.7.0; fi
unzip *.zip
rm *.zip
