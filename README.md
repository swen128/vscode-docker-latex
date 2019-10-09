## Prerequisites

* [Docker](https://www.docker.com/)
* [VS Code](https://code.visualstudio.com/)
* The [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension for VS Code


## Usage

1. Clone this repository.
2. Open the command palette in VS Code, and choose 'Remote-Containers: Open Folder in Container...'.
3. Edit `.tex` files at `/workspace/tex` inside the Docker container.
4. PDF file is built at `/workspace/build` whenever `.tex` file is modified.
