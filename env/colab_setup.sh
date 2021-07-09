#!/usr/bin/env sh
# adapted from https://blog.silvan.codes/2021/06/03/run-minerl-on-colab.html
add-apt-repository ppa:openjdk-r/ppa -y
apt-get update
apt-get install -y openjdk-8-jdk
update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

apt-get install -y xvfb xserver-xephyr tigervnc-standalone-server xfonts-base

curl -sLo noVNC.zip https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.zip
unzip -qo noVNC.zip
rm noVNC.zip
mv noVNC-1.2.0 /usr/local/bin/noVNC

curl -sLo ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -q ngrok.zip
rm ngrok.zip
mv ngrok /usr/local/bin

tmux new-session -d /usr/local/bin/noVNC/utils/launch.sh
tmux new-session -d ngrok http 6080 --region eu