FROM mcr.microsoft.com/vscode/devcontainers/base:0-ubuntu-20.04
USER vscode

# Install GitHub CLI
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
    sudo apt-get update && \
    sudo apt-get install -y gh

# Install Node Version Manager
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Install Python
RUN sudo apt-get install -y python3 python3-pip python-is-python3 && \
    pip install --upgrade pip && \
    pip install fastapi matplotlib numpy pandas tensorflow uvicorn

# Install CUDA Toolkit 11.6
RUN sudo wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin && \
    sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600 && \
    sudo wget https://developer.download.nvidia.com/compute/cuda/11.6.2/local_installers/cuda-repo-ubuntu2004-11-6-local_11.6.2-510.47.03-1_amd64.deb && \
    sudo dpkg -i cuda-repo-ubuntu2004-11-6-local_11.6.2-510.47.03-1_amd64.deb && \
    sudo apt-key add /var/cuda-repo-ubuntu2004-11-6-local/7fa2af80.pub && \
    sudo apt-get update && \
    sudo apt-get install -y cuda

# Configure Zsh
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k && \
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
COPY --chown=vscode:vscode .zshrc /home/vscode/.zshrc
COPY --chown=vscode:vscode .p10k.zsh /home/vscode/.p10k.zsh

# Optimize
RUN sudo apt-get upgrade -y && \
    sudo apt-get autoremove -y && \
    sudo rm -rf /var/lib/apt/lists/*

# Initialize
RUN /bin/zsh -c "source ~/.zshrc && nvm install --lts && nvm use --lts && corepack enable" && \
    mkdir -p ~/repositories/nbsp1221/studying
