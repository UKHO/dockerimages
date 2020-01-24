subinclude("//build_defs:docker")
subinclude("//build_defs:sh")

docker_image_targets = docker_images(
    dockerfiles = glob(["*/Dockerfile"]),
    versions = [git_commit()[0:8]],
    repo = "ukhydrographicoffice",
)

sh_group(
    name = "build",
    deps = docker_image_targets,
)

sh_group(
    name = "publish",
    deps = [
        push_target
        for target in docker_image_targets
        for push_target in [f"{target}_push"]
    ],
)
