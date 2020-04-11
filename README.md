# Ingresso-App
Test Automation with Appium framework


### Instalando Ambiente no Mac
```
a. Instalar o Homebrew:
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"r
   
b. Instalar JDK para o Mac:
   http://www.oracle.com/technetwork/java/javase/downloads/index.html

c. Instalando e configurando o rbenv:
   brew install rbenv
   echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
   rbenv install -l
   rbenv install 2.6.3 #Ou versão superior estável
   rbenv local 2.6.3

d. Instalar Android Studio
   https://developer.android.com/studio/index.html?hl=pt-br
   
e. Instalar Appium Desktop
   http://appium.io/ => Clique em download e baixe a versão mais recente para o seu SO
```

### Estrutura do projeto
````text
├── app             (pasta para incluir o apk)
└── config          (capabilities e cucumber profile)
└── features        (pasta principal do projeto)
|    ├── elements   (pasta com o mapeamento dos elementos em estrutura para possível setup de iOS)
|    └── screens    (pasta com os metodos utilizado nas telas do app)
|    └── spec       (pasta com as features)
|    └── step_definitions    (pasta com os steps executaveis das features)
|    └── support    (pasta os arquivos de suporte para o projeto)
|        ├── base_screen.rb     (Classe com os métodos comuns para as screens)
|        ├── env.rb             (arquivo com o carregamento do ambiente para execução)
|        ├── hooks.rb           (arquivo base com hooks antes e pós execução de cenários)
|        ├── instance_helper.rb (arquivo que gerencia o instanciamento das screens)
|        ├── utils.rb           (Módulo com alguns métodos de configuração de ambiente)
└── report          (pasta com os relatórios de execução)
└── Dockerfile      (Imagem com o setup do ruby para possível execução em uma Pipeline)
└── Gemfile         (arquivo com as libs/gems utilizadas no projeto)
└── Rakefile.rb     (arquivo com task de execução do projeto)

````

### Instalando Gerenciador de gems do Ruby
```
gem install bundler
```

### Executando o Projeto :dart:
```
1. Faça um clone do projeto:
   git clone https://github.com/Thialison/ingresso-app.git

2. Acesse a pasta pelo terminal e execute o comando:
   bundle

3. Emulando android virtual device: 
   emulator @"<Nome do seu emulator>"&
   
4. Abra o Appium e inicie o servidor do mesmo.

5. Executando todos os cenários: 
   cucumber
   
6. Executando os cenários com report: 
   cucumber -p report

7. Também é possível executar os cenários com rake:
  rake android [ele tem algumas validações de ambiente. Ex.: App não encontrado, Device não encontrado]
```