# docker-cron-logrotate
測試 docker 內定時(crontab)切割日誌(logrotate)功能

預計在 ubuntu 內部

# 每一分鐘寫一次 log

## 建立 /script/generatelog.sh
```
mkdir -p /script
cd /script
touch generatelog.sh
chmod +x generatelog.sh
```

## 撰寫連續 log 的 shell
```
vim generatelog.sh
time=$(date +"%Y_%m%d_%H%M_%S")
echo ${time} >> /log/time.log
```

## 啟動 shell 看看
```
mkdir -p /log
source /script/generatelog.sh
cat /log/time.log
```

## 設定 crontab
```
crontab -e
TZ=Asia/Taipei
* * * * * /script/generatelog.sh >> /log/cron.log 2>&1
crontab -l
```

## 啟動 crontab cron 指令會 背景執行
```
cron
tail -f /log/time.log
top
kill PID
```

# 每兩分鐘切一次 log

## 建立 /etc/logrotate.d/myrotate
```
cd /etc/logrotate.d
touch myrotate
chmod 644 myrotate
```

## 撰寫 logrotate 內容
```
vim myrotate
/log/time.log {

    missingok
    create 777 root root
    rotate 10

    daily
    dateext
    dateformat .%Y-%m%d-%s

    olddir archive/
    createolddir 777 root root

    postrotate
        time=$(date +"%Y_%m%d_%H%M_%S")
        echo ${time} >> /log/time_rotate.log
    endscript
}
```

## 啟動 logrotate 看看
```
logrotate -f /etc/logrotate.d/myrotate >> /log/cron.log 2>&1
ls /log -ltr
ls /log/archive -ltr

cat /log/cron.log
cat /log/time_rotate.log

cat /log/time.log
```

## 設定 crontab
```
crontab -e
TZ=Asia/Taipei
0-58/2 * * * * /script/generatelog.sh >> /log/cron.log 2>&1
1-59/2 * * * * logrotate -f /etc/logrotate.d/myrotate >> /log/cron.log 2>&1
crontab -l

tail -f /log/time_rotate.log
tail -f /log/cron.log

watch -n 5 ls /log/archive -ltr
```

# Git Commit Message 這樣寫會更好
https://wadehuanglearning.blogspot.com/2019/05/commit-commit-commit-why-what-commit.html
