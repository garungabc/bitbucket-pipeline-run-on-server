echo "Deploy script started"
exec ssh-agent bash
eval ssh-agent -s
ssh-add ~/.ssh/id_rsa_pipeline_carrick
cd /path/project/on/server/
git checkout staging
git pull origin staging
# run if using docker
docker-compose restart
docker exec jw_apache php /var/www/html/index.php migrator run
#=====
exit
echo "Deploy script finished execution"