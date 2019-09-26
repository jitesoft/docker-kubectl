# Kubectl on Alpine Linux


## Tags

The image is built automatically via CI, so the versions may change, but the CI script builds
the latest stable versions and uses latest alpine as base image. Check `tags` for full list of supported
versions.

### Docker Hub images

* `jitesoft/kubectl`
    * `latest`, `v1.16`, `v1.16.0`

### GitLab images

* `registry.gitlab.com/jitesoft/dockerfiles/kubectl`
    * `latest`, `v1.16`, `v1.16.0`

## Usage

```bash 
docker run --rm jitesoft/kubectl version
```

Image can be found at [GitLab](https://gitlab.com/jitesoft/dockerfiles/kubectl)

### Image labels

This image follows the [Jitesoft image label specification 1.0.0](https://gitlab.com/snippets/1866155).
