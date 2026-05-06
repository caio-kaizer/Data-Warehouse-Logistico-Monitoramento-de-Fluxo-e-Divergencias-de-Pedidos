# Data-Warehouse-Logistico-Monitoramento-de-Fluxo-e-Divergencias-de-Pedidos
Pipeline de Dados End-to-End: SQL Server, SSIS e Power BI para monitoramento de fluxo logístico.

# Data Warehouse Logístico: Monitoramento de Fluxo e Divergências 🚀

Este projeto apresenta uma solução **End-to-End** de Engenharia de Dados para o setor logístico, focado no monitoramento de movimentação de materiais e identificação de divergências em notas fiscais.

## 📋 Visão Geral
O objetivo foi transformar dados brutos de um almoxarifado em insights estratégicos. O pipeline processa mais de **120 mil registros**, garantindo a integridade dos dados através de um processo estruturado de ETL e modelagem dimensional.

## 🏗️ Arquitetura da Solução
A estrutura do projeto segue o fluxo lógico de engenharia:

1. **Geração de Dados (`01_python_scripts`)**: Script Python automatizado para simular o cenário real de movimentação logística (120k linhas).
2. **Armazenamento (`02_sql_scripts`)**: Implementação de ambiente Raw e Data Warehouse no **SQL Server** utilizando o modelo **Star Schema** (Fatos e Dimensões).
3. **Integração e ETL (`03_etl_ssis`)**: Desenvolvimento de pacotes no **SSIS** para automação da extração, transformação e carga dos dados.
4. **Business Intelligence (`04_dashboard`)**: Visualização avançada no **Power BI** com foco em KPIs de performance e erros operacionais.

## 🛠️ Tecnologias Utilizadas
* **Python**: Geração de massa de dados sintéticos.
* **T-SQL (SQL Server)**: Modelagem, criação de Constraints e tratamento de dados.
* **SSIS (SQL Server Integration Services)**: Orquestração do pipeline de ETL.
* **Power BI**: Storytelling de dados e Dashboards.
* **SQL Architect**: Modelagem lógica do banco de dados.

## 📊 Resultados e Documentação
Na pasta `05_documentation`, você encontrará:
* **Modelo Lógico**: O desenho da arquitetura dimensional.
* **Evidências de Testes**: Prints comprovando o sucesso da carga de dados (Carga Raw e Carga Final).
* **Dashboard Final**: Visualização dos KPIs de divergência (24,80%) e peso movimentado (245,38 Bi).
