import self as self


class Responsavel_Class:
    def __init__(self):
        self.cpf = self.cpf
        self.email = self.email
        self.telefone = self.telefone


    def registro_responsavel (self):
        self.cpf = input("Digite seu CPF")
        self.email = input("Digite seu email")
        self.telefone = input("Digite o contato")

        if not  self.cpf or not self.email or not self.telefone:
            raise ValueError("Preencha os campos obrigatórios")


