
來測試一下
entry 跟 cmd 都有會怎樣？
docker inspect viper_n_db

docker inspect bdo_db_temp
docker inspect cronlogrotate

docker inspect bdo_db

Args
Cmd
Entrypoint

所以當兩個都有打的時候
就變成
Entrypoint Cmd
Cmd 只是多了可以被取代的部分



打包一顆看看
https://github.com/GoogleCloudPlatform/mariadb-docker/blob/master/10/debian9/10.3/Dockerfile


那這樣 怎樣多重啟動？
https://stackoverflow.com/questions/64935070/issue-running-cron-on-mysql-docker-container


別人的範例是 直接 覆寫 Entrypoint
https://www.huaweicloud.com/articles/181eaa93f678cfd14118d8bf8908f343.html