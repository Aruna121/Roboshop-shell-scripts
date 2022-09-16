LOG_FILE=/tmp/catalogue

echo "Setup NodeJS Repos"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${LOG_FILE}
echo status = $?

echo "Install NodeJS"
# yum install nodejs -y &>>${LOG_FILE}
echo status = $?

echo "Add Roboshop Application User"
# useradd roboshop&>>${LOG_FILE}
echo status = $?

echo "Download Catalogue Application code"
$ curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>${LOG_FILE}
echo status = $?

echo "Extract Application Catalogue code"
unzip /tmp/catalogue.zip &>>${LOG_FILE}
echo status = $?

mv catalogue-main catalogue
cd /home/roboshop/catalogue

echo "Install Nodejs dependencies"
npm install &>>${LOG_FILE}
echo status = $?

echo "setup catalogue service"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service &>>${LOG_FILE}
echo status = $?

systemctl daemon-reload &>>${LOG_FILE}
systemctl enable catalogue &>>${LOG_FILE}

echo "start catalogue service"
systemctl start catalogue &>>${LOG_FILE}
echo status = $?
