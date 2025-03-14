# Modelagem Hospitalar

## 1 - Paciente
- **ID_Paciente** (Identificador único)
- **Nome**
- **CPF**
- **Data_Nascimento**
- **Endereço**
- **Telefone**
- **Email**

## 2. Medicamento
- **ID_Medicamento** (Identificador único)
- **Nome**
- **Dosagem**
- **Fabricante**
- **Data_Validade**
- **Quantidade_Estoque**
- **Preço_Unitário**

## 3. Prescrição Médica
- **ID_Prescricao** (Identificador único)
- **Data_Prescricao**
- **ID_Medico** (Chave estrangeira para Médico)
- **ID_Paciente** (Chave estrangeira para Paciente)

## 4. Médico
- **ID_Medico** (Identificador único)
- **Nome**
- **CRM** (Conselho Regional de Medicina)
- **Especialidade**

## 5. Atendimento
- **ID_Atendimento** (Identificador único)
- **Data_Atendimento**
- **Hora_Atendimento**
- **ID_Medico** (Chave estrangeira para Médico)
- **ID_Paciente** (Chave estrangeira para Paciente)

## 6. Setor Ambulatorial
- **ID_Setor_Ambulatorial** (Identificador único)
- **Nome_Setor**
- **Localizacao**
- **Equipe_Medica** (Lista de IDs de médicos)

## 7. Setor de Emergência
- **ID_Setor_Emergencia** (Identificador único)
- **Nome_Setor**
- **Localizacao**
- **Equipe_Medica** (Lista de IDs de médicos)

## 8. Receita Médica
- **ID_Receita** (Identificador único)
- **ID_Prescricao** (Chave estrangeira para Prescrição Médica)
- **ID_Medicamento** (Chave estrangeira para Medicamento)
- **Quantidade_Prescrita**

## 9. Funcionário
- **ID_Funcionario** (Identificador único)
- **Nome**
- **Cargo**
- **ID_Setor** (Chave estrangeira para Setor Ambulatorial ou Setor de Emergência)
