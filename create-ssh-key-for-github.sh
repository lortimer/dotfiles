# Generate a keypair - follow the prompts
ssh-keygen -t ed25519 -C "your_email@example.com"

# add the keypair to the ssh agent
## start the agent in the background
eval "$(ssh-agent -s)"

## On MacOS, add to the ssh config
echo 'Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_ed25519' > ~/.ssh/config

## Add keys to agent
ssh-add ~/.ssh/id_ed25519

# Add public key to Github https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
pbcopy < ~/.ssh/id_ed25519.pub

# Go to https://github.com/settings/keys, click "New Key", and paste the public key you copied above
