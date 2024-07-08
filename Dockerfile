# Use the latest Python slim image as the base image
FROM python:3.12-slim-bookworm as base

# Install zsh, git, and dependencies for zsh-syntax-highlighting and zsh-autosuggestions
RUN apt-get update && \
apt-get install -y curl zsh git && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install the "powerlevel10k" theme
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Set up zsh as the default shell with powerlevel10k theme
RUN echo "ZSH_THEME='powerlevel10k/powerlevel10k'" >> $HOME/.zshrc && \
echo "source $HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme" >> $HOME/.zshrc && \
echo "source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc && \
echo "source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc && \
chsh -s $(which zsh)

# Add Meslo fonts
RUN apt-get install -y fonts-powerline

# Install Poetry
RUN pip install poetry --no-cache-dir

# Stage : Development
FROM base as development

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install development dependencies
# RUN poetry config virtualenvs.create false && poetry install

# Run app.py when the container launches
CMD ["python", "app.py"]
