subinclude("//build_defs:docker")
subinclude("//build_defs:sh")

targets = [
  {
      "name": dirname(dockerfile),
      "dockerfile": dockerfile,
      "srcs": glob([dirname(dockerfile) + "/**"])
  }
  for dockerfile in glob(["*/Dockerfile"])
]

for target in targets:

    target["build_rule"] = docker_image(
        name = target["name"],
        srcs = target["srcs"],
        dockerfile = target["dockerfile"],
    )

    target["push_rule"] = target["build_rule"] + "_push"

sh_group(
    name = "push",
    deps = [target["push_rule"] for target in targets],
)
