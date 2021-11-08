param(
    $action = "build"
)
pip3 install --user click requests pathlib

python runner.py --win $action
