server-monitoring
=================

Rotina simples que dispara requisções contra sites de uma lista e envia o
relatório por email. Quando é encontrado algum problema, o relatorio é enviado
para o email de time. Do contrário, o relatório só enviado para o admin.


Requisitos
----------

* mail
* curl


Começando
---------

    git clone https://github.com/hacklabr/server-monitoring.git
    cd server-monitoring
    cp settings.cfg.example settings.cfg
    ./add-to-cron.sh

O arquivo `settings.cfg` deve conter emails válidos.
