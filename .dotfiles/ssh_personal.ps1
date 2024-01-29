echo ''
echo 'Creating SSH key for the personal account'
echo ''
ssh-keygen -t ed25519 -C "13894059+Krauzer94@users.noreply.github.com"
start msedge https://github.com/settings/keys
cat .\.ssh\id_ed25519
echo ''
echo 'New SSH key created under .\.ssh\id_ed25519'
echo ''
