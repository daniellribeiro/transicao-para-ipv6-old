# Transicao para ipv6
Esse tutorial tem o objetivo de auxiliar na execução dos testes práticos das técnicas de transição abaixo, que auxiliaram na transição do IPV4 para o IPV6.
- Pilha Dupla

Primeiramente será preciso baixar os programas abaixo:
- [Oracle VirtualBox](https://download.virtualbox.org/virtualbox/6.1.22/VirtualBox-6.1.22-144080-Win.exe)
- [Baixar VM](https://ipv6.br/downloads/CursoIPv6br-CORE4.6-20150318.ova)

## Importar Máquina Virtual
- Abrir o software Oracle VirtualBox
- Clicar em Arquivo > Importar Appliance
- Selecionar a VM baixada, avançar os passos, e clicar em importar.

## Ajustar tamanho da tela
- Clicar em iniciar, para abrir o ambiente que será usado nos testes
- No software do Oracle VirtualBox clicar em Dispositivos > Inserir imagem de CD dos adicionais para convidado
- Na VM > clicar em File Manager > VBox_GAs_6.1.22
- Na VM > ir para Área de Trabalho > abrir Terminal Emulador
- Executar o script abaixo:
```bash
sudo su -
```
O comando acima solitara uma senha, digitar ipv6br
```bash
cd /media/VBox_GAs_6.1.22
./VBoxLinuxAdditions.run
reboot
```
A VM reiniciará
Na VM > clicar em iniciar > Settings > Display > em "Resolution" mudar para resolução do seu monitor

##Habilitar compartilhamento de arquivos entre a VM e a Máquina Física
- Na VM > clicar em Dispositivos > Área de Transferencia Compartilhada > marcar bi-direcional
- Na VM > clicar em Dispositivos > Arastar e Soltar > marcar bi-direcional

## Pilha Dupla
- Baixar arquivo pilha_dupla.imn
- Arastar arquivo baixado para VM
- Abrir arquivo pilha_dupla.imn
- Clicar no Play
- Clicar duas vezes no pc1, para abrir o terminal
- Digitar: ```ping6 2001:db8:1::20```
- Em packet loss deve aparecer 0%
- Digitar: ```ping 192.0.3.20```
- Em packet loss deve aparecer 0%
