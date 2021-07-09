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
- Digitar os comandos abaixo no terminal:
```
touch tayga.conf

echo tun-device nat64 >> tayga.conf
echo ipv4-addr 192.168.255.1 >> tayga.conf
echo prefix 2001:db8:ca00::/96 >> tayga.conf
echo dynamic-pool 192.168.255.0/24 >> tayga.conf
echo data-dir /tmp >> tayga.conf
echo map 192.168.255.100 2001:db8:ca5a:2::2 >> tayga.conf

tayga --mktun

ip link set nat64 up
ip route add 192.168.255.0/24 dev nat64
ip -6 route add 2001:db8:ca00::/96 dev nat64

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o nat64 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i nat64 -o eth0 -j ACCEPT

tayga -d -c tayga.conf

```
- Abrir host n1 e digitar os comandos abaixo:
```
ping6 -c 4 2001:db8:ca00::203.0.113.200
```
- Em packet loss deve aparecer 0%

- Digitar o comando abaixo em n1:
```
host 203.0.113.200
```
- O comando acima irá revelar que a url do servidor n10WWWExemplo é **www.exemplo.psi.br**
- Digitar o comando abaixo em n1:
```
ping6 -c 4 www.exemplo.psi.br
```
- Em packet loss deve aparecer 100%

- Abrir o servidor DNS64 e digitar o comando abaixo:
```
vi /etc/bind/named.conf
```
- Apertar letra **I** do teclado, para editar arquivo
- Acrescentar conteudo em negrito da forma mostrada abaixo:

