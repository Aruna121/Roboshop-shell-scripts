echo installing Nginx
yum install nginx -y &>>/tmp/frontend
echo status =$?

echo downloading Nginx Web content
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"&>>/tmp/frontend
echo status =$?

cd /usr/share/nginx/html

echo removing old content
rm -rf * &>>/tmp/frontend

echo extracting web content
unzip /tmp/frontend.zip &>>/tmp/frontend
echo status =$?

mv frontend-main/static/* &>>/tmp/frontend
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf

echo starting nginx service
systemctl enable nginx &>>/tmp/frontend
systemctl restart nginx &>>/tmp/frontend
echo status =$?