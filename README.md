# 🌐 Terraform Infrastructure: AWS Lab

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)

## 🚀 Sobre o Projeto
Este é um projeto pessoal focado no aprendizado prático de **Terraform** e **AWS**. A arquitetura foi desenhada para separar a infraestrutura de rede da camada de aplicação, permitindo um ambiente organizado, seguro e escalável.

## 🏗️ Estrutura do Repositório

O projeto está dividido em dois módulos principais:

### 1. Camada de Conectividade (`/Connectivity`)
A fundação da rede, responsável por todo o tráfego e isolamento:
- **VPC & Subnets**: VPC customizada com segregação entre subnets públicas e privadas (DMZ e Database).
- **Gateways**: Internet Gateway para tráfego público e NAT Gateway para permitir updates em instâncias privadas com segurança.
- **Roteamento**: Tabelas de rotas dinâmicas associadas a cada tier da rede.

### 2. Camada de Aplicação (`/Application`)
Onde residem os recursos computacionais (Em desenvolvimento):
- **Security Groups**: Firewalls lógicos com regras específicas para tráfego SSH (Linux) e RDP (Windows).
- **Instâncias EC2**: Provisionamento automatizado de servidores Linux e Windows.
- **Armazenamento**: Volumes EBS configurados para persistência de dados.

## 🧠 Aprendizados e Desafios Superados
Diferente de seguir um tutorial linear, este projeto envolveu desafios reais de administração de infraestrutura:
- **State Management**: Recuperação de arquivos `.tfstate` e sincronização de recursos após reorganização de diretórios.
- **In-place Updates**: Ajuste dinâmico de recursos existentes sem a necessidade de destruir a infraestrutura.
- **Refatoração**: Migração de código monolítico para uma estrutura de pastas organizada por responsabilidade.

## 🛠️ Execução
Para manter a independência, cada módulo deve ser inicializado separadamente:
```bash
# Para a Rede
cd Connectivity && terraform plan

# Para a Aplicação
cd Application && terraform plan