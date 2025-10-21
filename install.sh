export FROM_INSTALL_SH=1
time script -q install.log -c "sh $(pwd)/installers/main.sh"
