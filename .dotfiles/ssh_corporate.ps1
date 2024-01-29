echo ''
echo 'Creating SSH key for the corporate account'
echo ''
ssh-keygen -t rsa -b 4096 -C "144266741+Pedro-Rosa-10@users.noreply.github.com"
start chrome https://github.com/settings/keys
cat .\.ssh\id_rsa.pub
echo ''
echo 'New SSH key created under .\.ssh\id_rsa'
echo ''
