# Transicao para ipv6
Esse tutorial tem o objetivo de auxiliar na execução dos testes práticos das técnicas de transição abaixo, que auxiliaram na transição do IPV4 para o IPV6.
- Pilha Dupla
- Serviço de Tunnel Broker (Tunelamento)
- Túnel 6to4 (Tunelamento)
- NAT64 (Tradução)

Primeiramente será preciso baixar os programas abaixo:
- [Oracle VirtualBox](https://download.virtualbox.org/virtualbox/6.1.22/VirtualBox-6.1.22-144080-Win.exe)
- [Baixar VM](https://ipv6.br/downloads/CursoIPv6br-CORE4.6-20150318.ova)

## Importar Máquina Virtual
- Instalar o software Oracle VirtualBox
- Abrir o Oracle VirtualBox
- Clicar em Arquivo > Importar Appliance
- Selecionar a VM baixada, avançar os passos, e clicar em importar.

## Habilitar importar arquivos da Máquina Física para Máquina Virtual
- Ir na aba Dispositivos > Área de Transferência Compartilhada > Bi-direcional
- Ir na aba Dispositivos > Arastar e Soltar > Bi-direcional

## Ajustar tamanho da tela
- Clicar em iniciar, para abrir o ambiente que será usado nos testes
- Clicar em Dispositivos > Inserir imagem de CD dos adicionais para convidado
- Na VM > clicar em iniciar > File Manager > VBox_GAs_6.1.22
- Na VM > ir para Área de Trabalho > abrir Terminal Emulador
- Executar o script abaixo:
```bash
sudo su -
```
O comando acima solitara uma senha, digitar **ipv6br**
```bash
cd /media/VBox_GAs_6.1.22
./VBoxLinuxAdditions.run
reboot
```
- A VM reiniciará
- Na VM > clicar em iniciar > Settings > Display > em "Resolution" mudar para resolução do seu monitor

## Pilha Dupla
- Baixar arquivo pilha_dupla.imn
- Arastar arquivo baixado para VM
- Abrir arquivo pilha_dupla.imn
- Clicar no Play
- Clicar duas vezes no pc3, para abrir o terminal
- Digitar: ```ping6 2001:db8:0::20```
- Esperar uns 5 segundos e parar execução
- Em packet loss deve aparecer 0%
- Digitar: ```ping 192.168.1.20```
- Esperar uns 5 segundos e parar execução
- Em packet loss deve aparecer 0%

## NAT64
- Baixar o arquivo NAT_64.imn
- Arrastar arquivo baixado para VM
- Abrir arquivo NAT_64.imn
- Clicar no Play
- Clicar duas vezes no NAT64, para abrir o terminal
- Copiar o script abaixo no terminal:
```

```
