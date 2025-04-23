group "all" {
    targets = ["dependency-check", "terraform-win", "azure", "azure-devops", "dotnetcore80-zip", "esa-snap7-snappy", "jdk8-python38", "powershell-azure-node", "powershell-azure-node-newman", "terraform", "terraform-azure", "terraform-azure-make", "terraform-azure-powershell", "terraform-azure-powershell-go", "terraform-azure-powershell-python-go", "terraform-azure-powershell-unzip", "terraform-powershell"]
}

group "dependency-check" {
    targets = ["dependency-check"]
}

group "windows" {
    targets = ["terraform-win"]
}

group "linux" {
    targets = ["azure", 
    "azure-devops", 
    "dotnetcore80-zip", 
    "esa-snap7-snappy", 
    "jdk8-python38", 
    "powershell-azure-node", 
    "powershell-azure-node-newman", 
    "terraform", 
    "terraform-azure", 
    "terraform-azure-make", 
    "terraform-azure-powershell", 
    "terraform-azure-powershell-go", 
    "terraform-azure-powershell-python-go", 
    "terraform-azure-powershell-unzip", 
    "terraform-powershell"]
}

target "dependency-check" {
    context = "./V2/dependency-check"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/dependency-check:latest"]
    no-cache = true
}

target "terraform-win" {
    context = "./V2/win/terraform"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/terraform:latest-win"]
    no-cache = true
}

target "azure" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/azure:latest"]
    no-cache = true
}

target "azure-devops" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/azure-devops:latest"]
    no-cache = true
}

target "dotnetcore80-zip" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/dotnetcore80-zip:latest"]
    no-cache = true
}

target "esa-snap7-snappy" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/esa-snap7-snappy:latest"]
    no-cache = true
}

target "jdk8-python38" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/jdk8-python38:latest"]
    no-cache = true
}

target "powershell-azure-node" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/powershell-azure-node:latest"]
    no-cache = true
}

target "powershell-azure-node-newman" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/powershell-azure-node-newman:latest"]
    no-cache = true
}

target "terraform" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/terraform:latest"]
    no-cache = true
}

target "terraform-azure" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/terraform-azure:latest"]
    no-cache = true
}

target "terraform-azure-make" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/terraform-azure-make:latest"]
    no-cache = true
}

target "terraform-azure-powershell" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/terraform-azure-powershell:latest"]
    no-cache = true
}

target "terraform-azure-powershell-go" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/terraform-azure-powershell-go:latest"]
    no-cache = true
}

target "terraform-azure-powershell-python-go" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/terraform-azure-powershell-python-go:latest"]
    no-cache = true
}

target "terraform-azure-powershell-unzip" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/terraform-azure-powershell-unzip:latest"]
    no-cache = true
}

target "terraform-powershell" {
    context = "./V2/linux/azure"
    dockerfile = "Dockerfile"
    tags = ["ukhydrographicoffice/terraform-powershell:latest"]
    no-cache = true
}