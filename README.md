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


-----------------------------------------------------------------


# Criação e configuração da Instância EC2

- No painel de controle da AWS, acessar a área de EC2 para a criação da instância.
    - Preencher o campo com nome e tags necessárias.
    - Escolher a AMI Amazon Linux 2 AMI.
    - Escolher o tipo de instância t3.small.
    - Criar um par de chaves do tipo RSA.
    - Na área de configuração de rede, criar uma VPC para a instância, além de um novo grupo de segurança.
    - Na área de armazenamento, aumentar para 16GB.
- Acessar Segurança > Grupos de segurança no painel esquerdo, selecionar o grupo referente a EC2 criada e selecionar “Editar regras de entrada” para liberar o acesso as portas necessárias:

| Porta | Protocolo | Descrição |
| --- | --- | --- |
| 22 | TCP | SSH |
| 111 | TCP | RPC |
| 111 | UDP | RPC |
| 2049 | TCP | NFS |
| 2049 | UDP | NFS |
| 80 | TCP | HTTP |
| 443 | TCP | HTTPS |



# Configuração do NFS

- No terminal Linux (instância criada), utilizar os seguintes comandos para instalação e ativação do NFS (todos com permissão de root, com *sudo su* no início da sessão ou *sudo* na frente de cada comando):

*yum -y install nfs-utils*

*system systemctl enable nfs-server*

- Criar um novo diretório para o nfs:

*mkdir /mnt/nfs/*nome da sua pasta

*cd /etc*

*nano exports*

- O arquivo estará em branco, adicione a seguinte linha e salve o arquivo:

*/mnt/*nomedasuapasta **(rw,sync,no_subtree_check)*

- Após isso, reinicie o serviço com o seguinte comando:

*systemctl restart nfs-server*

- Para acessar a pasta através de outra máquina:

*sudo mount* ip_da_sua_máquina*:/mnt/*nome da sua pasta */mnt/local*