# Ref: https://docs.docker.com/get-started/docker-concepts/building-images/writing-a-dockerfile/
# Example build: docker build -t test-forge -f docker/forge/Dockerfile .
# Example to run: docker run -it test-forge

FROM python:3.12

# Setup an app user so the container doesn't run as the root user
# Home directory created to avoid warning with Python packages
RUN useradd -m mcp
WORKDIR /home/mcp

# Install the application dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code from the repo to the Docker Image WorkDir, set ownership to user
COPY . /home/mcp/

# Grant ownership to the Docker container user
RUN chown -R mcp:mcp /home/mcp/
#EXPOSE 8080

# Change the working directory to the game project directory
WORKDIR /home/mcp/work/forge/llm/IPD-LLM-Agents2

USER mcp

# Launch the shell
CMD ["/bin/bash"]