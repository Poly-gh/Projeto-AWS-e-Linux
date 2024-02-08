#!/bin/bash
    
    DATA=$(date +%d/%m/%Y)
    HORA=$(date +%H:%M:%S)
    SERVICO="httpd"
    STATUS=$(systemctl is-active $SERVICO)
   
    if [ $STATUS == "active" ]; then
        MENSAGEM="O $SERVICO está ONLINE"
        echo "$DATA $HORA - $SERVICO - active - $MENSAGEM" >> /mnt/nfs/nome_da_sua_pasta/online.txt
    else
        MENSAGEM="O $SERVICO está offline"
        echo "$DATA $HORA - $SERVICO - inactive - $MENSAGEM" >> /mnt/nfs/anome_da_sua_pasta/offline.txt
    fi