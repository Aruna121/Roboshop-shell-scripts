echo installing Nginx
yum install nginx -y
echo status =$?

echo downloading Nginx Web content
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
echo status =$?

cd /usr/share/nginx/html

echo removing old content
rm -rf *

echo extracting web content
unzip /tmp/frontend.zip
echo status =$?

mv frontend-main/static/* .
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf

echo starting nginx service
systemctl enable nginx
systemctl restart nginx
echo status =$?