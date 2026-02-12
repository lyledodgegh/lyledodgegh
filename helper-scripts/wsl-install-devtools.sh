# clean install developer tools on a fresh wsl instance
# usage: curl -fsSL https://raw.githubusercontent.com/lyledodgegh/lyledodgegh/refs/heads/main/helper-scripts/wsl-install-devtools.sh | bash

# update everything first
sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt auto-clean -y

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# the post install
echo >> /home/ubuntu/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> /home/ubuntu/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
sudo apt-get install build-essential gcc

# ms OpenJDK 25
ubuntu_release=`lsb_release -rs`
wget https://packages.microsoft.com/config/ubuntu/${ubuntu_release}/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get install apt-transport-https -y
sudo apt-get update -y
sudo apt-get install  -y

# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 24
node -v # Should print "v24.12.0".
npm -v # Should print "11.6.2".

# az cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd cli + extensions
curl -fsSL https://aka.ms/install-azd.sh | bash
azd extension install azure.ai.agents

# copilot
npm install -g @github/copilot

# claude
curl -fsSL https://claude.ai/install.sh | bash

# docker toolchain
# Add Docker's official GPG key:
sudo apt update -y
sudo apt install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose -y

# python3
sudo apt-get install python3-full python3-pip -y

# update all npm packages
npm install -g npm@latest

# golang
wget https://dl.google.com/go/go1.25.7.linux-amd64.tar.gz -O go1.25.7.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.25.7.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
rm go1.25.7.linux-amd64.tar.gz
