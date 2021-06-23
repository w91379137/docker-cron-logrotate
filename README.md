# docker-cron-logrotate
測試 docker 內定時(crontab)切割日誌(logrotate)功能

預計在 ubuntu 內部

# 每一分鐘寫一次 log

## mount /script/timelog.sh
## 啟動 shell 看看
```
/script/timelog.sh
cat /log/time.log
```

## 設定 crontab_1
```
crontab /script/cronjob_1
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

## mount /etc/logrotate.d/myrotate
## 啟動 logrotate 看看
```
logrotate -f /script/timelog_rotate >> /log/cron.log 2>&1
ls /log -ltr
ls /log/archive -ltr

cat /log/time.log
cat /log/time_rotate.log
cat /log/cron.log
```

## 設定 crontab
```
crontab /script/cronjob_2
crontab -l

tail -f /log/time_rotate.log
tail -f /log/cron.log

watch -n 5 ls /log/archive -ltr
```

# Git Commit Message 這樣寫會更好
https://wadehuanglearning.blogspot.com/2019/05/commit-commit-commit-why-what-commit.html
