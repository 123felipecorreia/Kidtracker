class Administrador:
    def __init__(self):
        self.cpf = None

        self.nome = None

    def registrar(self):
        self.cpf = input("Digite o CPF: ")
        self.nome = input("Digite o nome:")
        print("Informações de dados registrado")

        if not self.cpf or not self.nome:
            raise ValueError("CPF e Nome Obrigatório")





