variable "LIVE" {}

variable "TAG" {}

variable "SHA" {}

group "all" {
    targets = [
        "dependency-check", 
        "terraform-win", 
        "azure", 
        "azure-devops", 
        "dotnetcore80-zip", 
        "jdk8-python38", 
        "powershell-azure-node-newman", 
        "terraform", 
        "terraform-azure", 
        "terraform-azure-make", 
        "terraform-azure-powershell", 
        "terraform-azure-powershell-go", 
        "terraform-azure-powershell-python-go", 
        "terraform-azure-powershell-unzip", 
        "terraform-powershell", 
        "terraform-test-toolset"]
}

group "dependency-check" {
    targets = ["dependency-check"]
}

group "windows" {
    targets = ["terraform-win"]
}

group "linux" {
    targets = [
    "aws",
    "awscli",
    "azure", 
    "azure-devops", 
    "dotnetcore80-zip", 
    "jdk8-python38",  
    "powershell-azure-node-newman", 
    "terraform", 
    "terraform-azure", 
    "terraform-azure-make", 
    "terraform-azure-powershell", 
    "terraform-azure-powershell-go", 
    "terraform-azure-powershell-python-go", 
    "terraform-azure-powershell-unzip", 
    "terraform-powershell",
    "terraform-test-toolset"]
}

target "dependency-check" {
    context = "./dependency-check"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/dependency-check:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/dependency-check:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/dependency-check:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "terraform-win" {
    context = "./win/terraform"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/terraform:latest-win": "",
        notequal("",TAG) ? "ukhydrographicoffice/terraform:${TAG}-win": "",
        notequal("",SHA) ? "ukhydrographicoffice/terraform:${SHA}-win": ""
        ]
    output = [ "registry" ]
}

target "aws" {
    context = "./linux/aws"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/aws:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/aws:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/aws:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "awscli" {
    context = "./linux/awscli"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/awscli:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/awscli:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/awscli:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "azure" {
    context = "./linux/azure"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/azure:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/azure:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/azure:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "azure-devops" {
    context = "./linux/azure-devops"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/azure-devops:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/azure-devops:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/azure-devops:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "dotnetcore80-zip" {
    context = "./linux/dotnetcore80-zip"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/dotnetcore80-zip:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/dotnetcore80-zip:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/dotnetcore80-zip:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "dotnetcore100-zip" {
    context = "./linux/dotnetcore100-zip"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/dotnetcore100-zip:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/dotnetcore100-zip:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/dotnetcore100-zip:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "jdk8-python38" {
    context = "./linux/jdk8-python38"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/jdk8-python38:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/jdk8-python38:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/jdk8-python38:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "powershell-azure-node-newman" {
    context = "./linux/powershell-azure-node-newman"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/powershell-azure-node-newman:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/powershell-azure-node-newman:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/powershell-azure-node-newman:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "terraform" {
    context = "./linux/terraform"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/terraform:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/terraform:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/terraform:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "terraform-azure" {
    context = "./linux/terraform-azure"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/terraform-azure:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/terraform-azure:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/terraform-azure:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "terraform-azure-make" {
    context = "./linux/terraform-azure-make"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/terraform-azure-make:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/terraform-azure-make:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/terraform-azure-make:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "terraform-azure-powershell" {
    context = "./linux/terraform-azure-powershell"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/terraform-azure-powershell:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/terraform-azure-powershell:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/terraform-azure-powershell:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "terraform-azure-powershell-go" {
    context = "./linux/terraform-azure-powershell-go"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/terraform-azure-powershell-go:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/terraform-azure-powershell-go:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/terraform-azure-powershell-go:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "terraform-azure-powershell-python-go" {
    context = "./linux/terraform-azure-powershell-python-go"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/terraform-azure-powershell-python-go:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/terraform-azure-powershell-python-go:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/terraform-azure-powershell-python-go:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "terraform-azure-powershell-unzip" {
    context = "./linux/terraform-azure-powershell-unzip"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/terraform-azure-powershell-unzip:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/terraform-azure-powershell-unzip:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/terraform-azure-powershell-unzip:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "terraform-powershell" {
    context = "./linux/terraform-powershell"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/terraform-powershell:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/terraform-powershell:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/terraform-powershell:${SHA}": ""
        ]
    output = [ "registry" ]
}

target "terraform-test-toolset" {
    context = "./linux/terraform-test-toolset"
    dockerfile = "Dockerfile"
    tags = [
        notequal("",LIVE) ? "ukhydrographicoffice/terraform-test-toolset:latest": "",
        notequal("",TAG) ? "ukhydrographicoffice/terraform-test-toolset:${TAG}": "",
        notequal("",SHA) ? "ukhydrographicoffice/terraform-test-toolset:${SHA}": ""
        ]
    output = [ "registry" ]
}