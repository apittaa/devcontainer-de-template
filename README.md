# Devcontainer Template for Data Engineering Projects

![image](/images/devcontainer.png)
This is a template for a devcontainer for data engineering projects with Python, Docker, Poetry, pre-commit, and GitHub Actions (CI/CD).

The main objective of this template is to provide a development environment that is consistent across different machines and operating systems. This is achieved by defining the development environment in a container using the devcontainer feature of Visual Studio Code.

## Getting Started
To get started with this template, you need to have the following tools installed on your machine:

- [Visual Studio Code](https://code.visualstudio.com/)
- [Visual Studio Code Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [Docker](https://docs.docker.com/get-docker/)

### Setting up the Development Environment
1. Clone this repository to your local machine.
2. Open the repository in Visual Studio Code.
3. Click on the "Reopen in Container" button in the bottom right corner of the window.
4. The development environment will be built in a container and you will be able to start developing your project.

## Features

### Devcontainer
Devcontainer is a feature of Visual Studio Code that allows you to define a development environment in a container. This template includes a devcontainer configuration that allows you to develop your project in a container with all the dependencies installed. The devcontainer is defined in the `.devcontainer` directory.

### Python
This template uses Python as the main programming language. The Python version is defined in the `pyproject.toml` file. The dependencies are managed using Poetry.

### Poetry
Poetry is a tool for dependency management and packaging in Python. This template uses Poetry to manage the dependencies of the project. The dependencies are defined in the `pyproject.toml` file.

### Pre-commit
Pre-commit is a framework for managing and maintaining multi-language pre-commit hooks. This template includes a pre-commit configuration that runs code formatting and linting tools on the code before committing it. The pre-commit configuration is defined in the `.pre-commit-config.yaml` file.

### GitHub Actions
GitHub Actions is a feature of GitHub that allows you to automate your software development workflows. This template includes a GitHub Actions workflow that runs the pre-commit hooks and the tests on the code when a pull request is opened. The GitHub Actions workflow is defined in the `.github/workflows` directory.

## License
This template is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
