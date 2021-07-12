#language:pt

    Funcionalidade: Login

        Cenário: login valido
            Dado que eu acesso a pagina de login
            Quando eu preencho minhas informações 
            | email | testessoftware99@gmail.com |
            | senha | @Te987654321               |
            Então me logo no site visualizando a "Minha Conta"
        
        Cenário: Validar email não preenchido
            Dado que eu acesso a pagina de login 
            Quando eu preencho o meu login sem o email
            | email |                            |
            | senha | @Te987654321               |
            Então eu vejo a mensagem de erro "Email inválido"

        Cenário: Validar senha não preenchida
            Dado que eu acesso a pagina de login 
            Quando eu preencho o meu login sem a senha
            | email | testessoftware99@gmail.com |
            | senha |                            |
            Então eu vejo a mensagem de erro
 
        Cenário: Validar nenhum campo preenchido
            Dado que eu acesso a pagina de login
            Quando eu não preencho nenhum campo
            | email |                            |
            | senha |                            |
             Então eu visualizo a mensagem de erro 
