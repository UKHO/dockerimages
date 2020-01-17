subinclude("///build_defs/pleasings//python:requirements")

requirements_txt("requirements")

python_binary(
    name = "readme_push",
    main = "readme_push.py",
    deps = [":requirements"],
    visibility = ["PUBLIC"],
)
