# docker-cron-logrotate
測試 docker 內定時(crontab)切割日誌(logrotate)功能

預計在 ubuntu 內部

# 每一分鐘寫一次 log

## 新增 /script/generatelog.sh
```
mkdir -p /script
cd /script
touch generatelog.sh
chmod +x generatelog.sh
vim generatelog.sh
```

## 建立連續 log 的 shell
```
# generatelog.sh
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
* * * * * /script/generatelog.sh
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




# Git Commit Message 這樣寫會更好
https://wadehuanglearning.blogspot.com/2019/05/commit-commit-commit-why-what-commit.html
