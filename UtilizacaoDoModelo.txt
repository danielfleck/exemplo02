As alterações relativas ao modelo devem ser feitas no repositório esqueleto-app.git. Estas são automaticamente lançadas no endereço 10.47.0.72/git-downloads/esqueleto-app.tar.gz

--------------------------------
Alguns itens devem ser modificados para por ocasião do início de um novo projeto:
--------------------------------
1. Fazer uma cópia do arquivo de configuração do módulo proxyconfig:
cp vagrant/manifests/proxy_vars.pp.exemplo vagrant/manifests/proxy_vars.pp

2. Editar o arquivo vagrant/manifests/proxy_vars.pp, adicionando suas credenciais de proxy
Obs.: observe que o arquivo .gitignore na pasta vagrant/manifests impede que o arquivo contendo dados pessoais seja monitora pelo git
