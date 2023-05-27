class Crianca:
    def __init__(self):
        self.nome = None
        self.responsavel = None
        self.tipo_sanguineo = None
        self.cpf = None
        self.caracteristica = None
        self.endereco = None
        self.cidade = None

    def registrar_informacoes(self):
        self.nome = input("Digite o nome da criança: ")
        self.responsavel = input("Digite o nome do responsável: ")
        self.tipo_sanguineo = input("Digite o tipo sanguíneo da criança: ")
        self.cpf = input("Digite o CPF da criança: ")
        self.caracteristica = input("Digite uma característica da criança: ")
        self.endereco = input("Digite o endereço da criança: ")
        self.cidade = input("Digite a cidade da criança: ")
        print("Informações da criança registradas com sucesso!")



