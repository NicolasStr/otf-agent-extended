# otf-agent-extended

A Docker image extending the otf-agent image from [leg100/otf](https://github.com/leg100/otf) with additional tools for cloud automation and scripting.

---

## Overview

This project provides a Docker image based on `leg100/otf-agent`, with the following enhancements:

- Installs Python 3 and pip
- Installs AWS CLI (`awscli==1.41.0`)
- Installs Azure CLI (`azure-cli==2.70.0`)
- Includes build tools and libraries for Python development

This image is designed for use in automation, CI/CD pipelines, and environments where both AWS and Azure command-line tools are required alongside the OTF agent.

---

## Usage

You can use this image as a drop-in replacement for the base `otf-agent` image when you need AWS and Azure CLI support.

### Example (Docker CLI)

#### Building from source

```sh
git clone https://github.com/NicolasStr/otf-agent-extended.git
cd otf-agent-extended
docker build -t NicolasStr/otf-agent-extended .
docker run --rm -it NicolasStr/otf-agent-extended
```

#### Using from ghcr.io with version latest (latest not recommended for production usage)

```sh
docker run --rm -it ghcr.io/NicolasStr/otf-agent-extended:latest
```

---

## Customization

To add more Python packages, edit `python-requirements.txt` and rebuild the image.

---

## License

This project is licensed under the Mozilla Public License Version 2.0. See the [LICENSE](./LICENSE) file for details.

---

## Credits

- Base image: [leg100/otf](https://github.com/leg100/otf)
- AWS CLI: [aws/aws-cli](https://github.com/aws/aws-cli)
- Azure CLI: [Azure/azure-cli](https://github.com/Azure/azure-cli)

---

## Release Workflow & Package Updates

This repository uses GitHub Actions to automate Docker image builds and releases:

- **Automatic Release:** On every push to the `main` branch, a workflow checks for changes to the base image version or Python package versions (in `python-requirements.txt`).
- **Version Tagging:** If a new base image version or package version is detected, the workflow automatically tags and publishes a new Docker image version.
- **How to Update Packages:**
  1. Edit `python-requirements.txt` to update package versions (e.g., `azure-cli` or `awscli`).
  2. Commit and push your changes to the `main` branch.
  3. The workflow will build, tag, and release a new image with the updated versions.

See `.github/workflows/release.yml` for workflow details.