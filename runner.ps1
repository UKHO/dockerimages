param(
    $action = "build"
)
pip3 install --user click requests pathlib

python runnerwin.py --win $action
