#!/usr/bin/env bash

set -u

echo "kill start"
ps aux | grep "python run.py" | grep -v grep  | awk '{print $2}' | xargs kill -SIGINT
sleep 3
ps aux | grep "python run.py" | grep -v grep
echo "kill end"

echo "ffmpeg check"
which ffmpeg

echo "run MusicBot"
cd ~/projects/others/MusicBot1 && ~/.pyenv/versions/3.5.7/bin/python run.py >> log.log 2>&1 &
cd ~/projects/others/MusicBot2 && ~/.pyenv/versions/3.5.7/bin/python run.py >> log.log 2>&1 &
cd ~/projects/others/MusicBot3 && ~/.pyenv/versions/3.5.7/bin/python run.py >> log.log 2>&1 &

echo "finished restart"
exit 0

