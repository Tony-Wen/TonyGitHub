# 定义 Terraform 的配置文件
terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"  # Azure 资源提供商的源
            version = "3.102.0"  # Azure 资源提供商的版本
        }
    }
}

# 定义 Azure 服务提供商
provider "azurerm" {
    features {}  # 这个空的 features 块是必需的，用于启用 Azure 服务提供商的某些功能

    client_id       = "277c15f2-8d4d-4ae8-b9b8-5af15b20def7"
    client_secret   = "Udj8Q~dcFKmtZnAgX~FfNGwOnnAbDSW7CtTpDcPU"
    tenant_id       = "112c9ed4-6357-45bb-bbe9-018fdb35e8ee"
    subscription_id = "526f40bb-cd4c-422b-9acc-98ff37f9484b"

}

# 定义一个 Azure 资源组
resource "azurerm_resource_group" "example" {
    name     = "exampleRG-TonyWen"  # 资源组的名称
    location = "West Europe"  # 资源组的位置
}

# 定义一个 Azure 虚拟网络
resource "azurerm_virtual_network" "example" {
    name                = "example-networkofTony"  # 虚拟网络的名称
    resource_group_name = azurerm_resource_group.example.name  # 虚拟网络所在的资源组
    location            = azurerm_resource_group.example.location  # 虚拟网络的位置
    address_space       = ["10.0.0.0/16"]  # 虚拟网络的地址空间
}

# 定义一个 Azure 子网
resource "azurerm_subnet" "example" {
    name                 = "subnet1oftony"  # 子网的名称
    resource_group_name  = azurerm_resource_group.example.name  # 子网所在的资源组
    virtual_network_name = azurerm_virtual_network.example.name  # 子网所在的虚拟网络
    address_prefixes     = ["10.0.0.0/24"]  # 子网的地址前缀
}

/*
# 定义一个 Azure 网络接口
resource "azurerm_network_interface" "example" {
    name                = "example-nic"  # 网络接口的名称
    location            = azurerm_resource_group.example.location  # 网络接口的位置
    resource_group_name = azurerm_resource_group.example.name  # 网络接口所在的资源组

    ip_configuration {
        name                          = "internal"  # IP 配置的名称
        subnet_id                     = azurerm_subnet.example.id  # IP 配置所在的子网
        private_ip_address_allocation = "Dynamic"  # 私有 IP 地址的分配方法
        public_ip_address_id          = azurerm_public_ip.example.id  # 公共 IP 地址的 ID
    }
}

# 定义一个 Azure 公共 IP 地址
resource "azurerm_public_ip" "example" {
    name                = "example-pip"  # 公共 IP 地址的名称
    location            = azurerm_resource_group.example.location  # 公共 IP 地址的位置
    resource_group_name = azurerm_resource_group.example.name  # 公共 IP 地址所在的资源组
    allocation_method   = "Dynamic"  # IP 地址的分配方法
}

# 定义一个 Azure 网络安全组
resource "azurerm_network_security_group" "example" {
    name                = "example-nsg"  # 网络安全组的名称
    location            = azurerm_resource_group.example.location  # 网络安全组的位置
    resource_group_name = azurerm_resource_group.example.name  # 网络安全组所在的资源组

    security_rule {
        name                       = "allow_http"  # 安全规则的名称
        priority                   = 1001  # 安全规则的优先级
        direction                  = "Inbound"  # 安全规则的方向
        access                     = "Allow"  # 安全规则的访问权限
        protocol                   = "Tcp"  # 安全规则的协议
        source_port_range          = "*"  # 安全规则的源端口范围
        destination_port_range     = "80"  # 安全规则的目标端口范围
        source_address_prefix      = "*"  # 安全规则的源地址前缀
        destination_address_prefix = "*"  # 安全规则的目标地址前缀
    }
}

# 定义一个 Azure 虚拟机
resource "azurerm_virtual_machine" "example" {
    name                  = "example-machine"  # 虚拟机的名称
    location              = azurerm_resource_group.example.location  # 虚拟机的位置
    resource_group_name   = azurerm_resource_group.example.name  # 虚拟机所在的资源组
    network_interface_ids = [azurerm_network_interface.example.id]  # 虚拟机的网络接口 ID
    vm_size               = "Standard_F2"  # 虚拟机的大小
    delete_os_disk_on_termination = true  # 是否在终止虚拟机时删除操作系统磁盘

    storage_image_reference {
        publisher = "Canonical"  # 镜像的发布者
        offer     = "UbuntuServer"  # 镜像的提供者
        sku       = "16.04-LTS"  # 镜像的 SKU
        version   = "latest"  # 镜像的版本
    }

    storage_os_disk {
        name              = "os-disk"  # 操作系统磁盘的名称
        caching           = "ReadWrite"  # 操作系统磁盘的缓存策略
        create_option     = "FromImage"  # 操作系统磁盘的创建选项
        managed_disk_type = "Premium_LRS"  # 操作系统磁盘的类型
    }

    os_profile {
        computer_name  = "hostname"  # 虚拟机的计算机名
        admin_username = "testadmin"  # 管理员用户名
        admin_password = "Password1234!"  # 管理员密码
    }

    os_profile_linux_config {
        disable_password_authentication = false  # 是否禁用密码认证
    }
}
*/
