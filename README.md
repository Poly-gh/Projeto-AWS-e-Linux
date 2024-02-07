# Projeto Compass UOL

# Requisitos AWS

- Gerar uma chave pública para acesso ao ambiente.
- Criar uma Instância EC2: Amazon Linux 2 (t3.small, 16GB SSD).
    - Anexar 1 Elastic IP.
    - Liberar portas para acesso público:
        - 22/TCP
        - 111/TCP e UDP
        - 2049/TCP e UDP
        - 80/TCP
        - 443/TCP

# Requisitos Linux

- Configurar NFS entregue.
- Criar diretório dentro do filesystem do NFS com seu nome.
- Subir um apache no servidor, que deve estar online e rodando na apresentação.
- Criar um script para validar se o serviço está online e enviar o resultado para o seu diretório NFS.
    - O script deve conter: Data hora + nome do serviço + status + mensagem personalizada de online ou offline.
    - O script deve gerar 2 arquivos de saída: 1 para o serviço online e 1 para o serviço offline.
    - O script deve ser executado a cada 5 minutos, de forma automatizada.


