import tkinter
from tkinter import ttk
import requests
from tkinter import *
import qrcode

lista_praias = ["Adão e Eva","Gragoatá","Boa Viagem","Flexas","São Francisco","Charitas","Jurujuba","Icaraí","Itacoatiara","Piratininga","Camboinhas","Sossego","Itaipu"]



def registrar_informacoes():
    self.nome = input("Digite o nome da criança: ")
    self.responsavel = input("Digite o nome do responsável: ")
    self.sanguineo = input("Digite o tipo sanguíneo da criança: ")
    self.cpf = input("Digite o CPF da criança: ")
    self.caracteristica = input("Digite uma característica da criança: ")
    self.endereco = input("Digite o endereço da criança: ")
    self.cidade = input("Digite a cidade da criança: ")
    print("Informações da criança registradas com sucesso!")

janela = Tk()
janela.title("Cadastro da criança ")
janela.geometry ("400x400")

texto_orientacao = Label(janela, text="Ficha de cadastro do usuario")
texto_orientacao.grid (column=1, row=0)

texto_orientacao= Label (janela, text="Insira o nome da criança")
texto_orientacao.grid (column=0, row=2)
entry_descricao = tkinter.Entry()
entry_descricao.grid (column=1, row=2)

texto_orientacao = Label (janela, text= "Digite o nome do responsável")
texto_orientacao.grid (column=0, row=3)
entry_descricao = tkinter.Entry()
entry_descricao.grid (column=1, row=3)

texto_orientacao = Label (janela, text= "Digite o tipo Sanguíneo da Criança")
texto_orientacao.grid (column=0, row=4)
entry_descricao = tkinter.Entry()
entry_descricao.grid (column=1, row=4)

texto_orientacao = Label (janela, text= "Digite o CPF da criança")
texto_orientacao.grid (column=0, row=5)
entry_descricao = tkinter.Entry()
entry_descricao.grid (column=1, row=5)

texto_orientacao = Label (janela, text="Digite a caracteristica da criança")
texto_orientacao.grid (column=0, row=6)
entry_descricao = tkinter.Entry()
entry_descricao.grid (column=1, row=6)

texto_orientacao = Label (janela, text= "Digite o Endereço da Criança")
texto_orientacao.grid (column=0, row=7)
entry_descricao = tkinter.Entry()
entry_descricao.grid (column=1, row=7)

texto_orientacao = Label (janela, text= "Digite a cidade de Residência da criança")
texto_orientacao.grid (column=0, row=8)
entry_descricao = tkinter.Entry()
entry_descricao.grid (column=1, row=8)


texto_orientacao = Label (janela, text="Selecione a praia em que a criança foi vista pela última vez")
texto_orientacao.grid (column=2, row=2)
combobox_praia = ttk.Combobox (values= lista_praias)
combobox_praia.grid (column=3, row=2)





botao = Button(janela, text="Gerar QR Code")
botao.grid(column=0,row=9)


janela.mainloop()