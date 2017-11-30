docker build -t mattermost-dev %~dp0

SET MATTERMOST_DIR=%~dp0/../..
docker stop mattermost-dev
docker rm mattermost-dev

docker run -it^
 -p 8065:8065^
 -v %MATTERMOST_DIR%/mattermost-server:/root/go/src/github.com/mattermost/mattermost-server^
 -v %MATTERMOST_DIR%/mattermost-webapp:/root/go/src/github.com/mattermost/mattermost-webapp^
 -v /var/run/docker.sock:/var/run/docker.sock^
 --name mattermost-dev^
 mattermost-dev