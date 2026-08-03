# Infraestrutura como Código — Pipeline Terraform acionado por Agente de IA (n8n)

Este repositório provisiona recursos na AWS (ex.: S3 e EC2) usando Terraform,
versionado no Git e executado por um pipeline de CI/CD no GitHub Actions.
O pipeline pode ser disparado manualmente ou pelo AGENT DEVOPS (n8n).

## Índice
1. Arquitetura
2. Como o Agente executa o código
3. Pré-requisitos
4. Estrutura do repositório
5. Passo 1 — Backend remoto do Terraform (state)
6. Passo 2 — Configurar credenciais AWS (Secrets)
7. Passo 3 — Código Terraform
8. Passo 4 — Workflow do GitHub Actions
9. Passo 5 — Integração com o Agente de IA (n8n)
10. Como executar
11. Fluxo de aprovação e segurança
12. Solução de problemas
