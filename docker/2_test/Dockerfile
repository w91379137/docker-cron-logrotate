
FROM cronlogrotate:20210621

WORKDIR /
COPY copy/ENTRYPOINT.sh .
COPY copy/CMD.sh .

RUN chmod 777 ENTRYPOINT.sh
RUN chmod 777 CMD.sh

ENTRYPOINT ["/ENTRYPOINT.sh"]
CMD ["/CMD.sh"]

# 其他人 解釋
# https://phoenixnap.com/kb/docker-cmd-vs-entrypoint