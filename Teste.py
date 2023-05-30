class Responsavel:
    def __init__(self):
        self.CPF = None
        self.email = None
        self.telefone = None

    def registrar_informacoes(self):
        self.CPF = input("Digite o CPF do responsável: ")
        self.email = input("Digite o e-mail do responsável: ")
        self.telefone = input("Digite o telefone do responsável: ")

        if not self.CPF or not self.email or not self.telefone:
            raise ValueError("CPF, email e telefone são campos obrigatórios. Preencha-os corretamente.")

        print("Informações do responsável registradas com sucesso!")


class Crianca:
    def __init__(self):
        self.nome = None
        self.responsavel = None
        self.tipo_sanguineo = None
        self.CPF = None
        self.caracteristica = None
        self.endereco = None
        self.cidade = None

    def registrar_informacoes(self):
        self.nome = input("Digite o nome da criança: ")
        self.responsavel = input("Digite o nome do responsável: ")
        self.tipo_sanguineo = input("Digite o tipo sanguíneo da criança: ")
        self.CPF = input("Digite o CPF da criança: ")
        self.caracteristica = input("Digite uma característica da criança: ")
        self.endereco = input("Digite o endereço da criança: ")
        self.cidade = input("Digite a cidade da criança: ")
        print("Informações da criança registradas com sucesso!")


class Cadastro:
    def __init__(self):
        self.logged_in = False

    def login(self):
        login = input("Digite seu login: ")
        senha = input("Digite sua senha: ")
        # Implemente aqui a verificação do login e senha no sistema de autenticação

        # Neste exemplo, vamos considerar que o login foi bem-sucedido
        self.logged_in = True

    def cadastrar_informacoes(self):
        if not self.logged_in:
            print("Faça o login para cadastrar as informações.")
            return

        responsavel = Responsavel()
        responsavel.registrar_informacoes()

        crianca = Crianca()
        crianca.registrar_informacoes()

        # Implemente aqui a lógica para armazenar as informações em um banco de dados

        print("Cadastro realizado com sucesso!")


cadastro = Cadastro()
cadastro.login()
cadastro.cadastrar_informacoes()
