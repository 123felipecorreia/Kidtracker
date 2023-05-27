class funcionario:

    def __init__(self):
        self.id = None
        self.cpf = None
        self.guarnicao = None

        def registro_funcionario (self):
            self.id = input("Insira sua identidade Militar")
            self.cpf = input("Insira seu CPF")
            self.guarnicao = input("Insira sua guarnição")

            if not self.id or not self.guarnicao:
                raise ValueError("Identificação obrigatória")




