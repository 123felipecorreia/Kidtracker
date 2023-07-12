import qrcode
from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput


class QRCodeGenerator(App):
    def build(self):
        layout = BoxLayout(orientation='vertical', spacing=10)

        # Widgets de entrada de texto
        layout.add_widget(Label(text="Nome da criança:"))
        self.entry_crianca = TextInput()
        layout.add_widget(self.entry_crianca)

        layout.add_widget(Label(text="Nome do responsável:"))
        self.entry_responsavel = TextInput()
        layout.add_widget(self.entry_responsavel)

        layout.add_widget(Label(text="Telefone:"))
        self.entry_telefone = TextInput()
        layout.add_widget(self.entry_telefone)

        layout.add_widget(Label(text="Cidade de residência:"))
        self.entry_cidade = TextInput()
        layout.add_widget(self.entry_cidade)

        layout.add_widget (Label(text= "Necessidades médicas (se tiver):"))
        self.entry_necessidades = TextInput()
        layout.add_widget(self.entry_necessidades)




        # Botão para gerar o QR Code
        btn_gerar_qr_code = Button(text="Gerar QR Code")
        btn_gerar_qr_code.bind(on_press=self.gerar_qr_code)
        layout.add_widget(btn_gerar_qr_code)

        return layout

    def gerar_qr_code(self, instance):
        dados = {
            'Nome': self.entry_crianca.text,
            'Responsável': self.entry_responsavel.text,
            'Telefone': self.entry_telefone.text,
            'Cidade': self.entry_cidade.text,
            'Necessidades médicas especiais?': self.entry_necessidades.text

            
        }

        qr = qrcode.QRCode(
            version=1,
            error_correction=qrcode.constants.ERROR_CORRECT_H,
            box_size=10,
            border=4,
        )
        qr.add_data(str(dados))
        qr.make(fit=True)

        imagem_qr = qr.make_image(fill_color="black", back_color="white")
        imagem_qr.save("qr_code.png")

        # Exibir o QR Code usando o visualizador de imagens padrão do sistema
        import os
        os.startfile("qr_code.png")  # Windows
        # Outra opção para sistemas Linux e macOS:
        # os.system("open qr_code.png")  # macOS
        # os.system("xdg-open qr_code.png")  # Linux


if __name__ == '__main__':
    QRCodeGenerator().run()
