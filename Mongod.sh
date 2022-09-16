LOG_FILE=/tmp/mongodb
echo "setting MongoDb Repo"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>LOG_FILE
echo status = $?

echo "Installing MongoDb Server"
yum install -y mongodb-org &>>LOG_FILE
echo status = $?

echo "update mongodb Listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
echo status =$?

echo "Starting MongoDb Service"
systemctl enable mongod &>>LOG_FILE
systemctl restart mongod &>>LOG_FILE
echo status = $?