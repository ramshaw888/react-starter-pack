curl -o- -L https://yarnpkg.com/install.sh | bash
rm /usr/local/bin/yarn
rm /usr/local/bin/yarnpkg
ln -s /root/.yarn/bin/yarn /usr/local/bin/yarn
ln -s /root/.yarn/bin/yarnpkg /usr/local/bin/yarnpkg
