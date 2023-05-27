from datetime import datetime
from flask import Flask, request, render_template, redirect, jsonify
from pymongo import MongoClient
import qrcode
from geopy.geocoders import Nominatim

# inicializa a aplicação Flask
app = Flask(_name_)

# configuração do banco de dados MongoDB
client = MongoClient('localhost', 27017)
db = client.localizador_pessoas
pessoas = db.pessoas

# inicializa o geolocalizador
geolocator = Nominatim(user_agent="localizador_pessoas")


# rota para a página principal
@app.route('/')
def index():
    return render_template('index.html')


# rota para o formulário de cadastro
@app.route('/cadastro')
def cadastro():
    return render_template('cadastro.html')


# rota para o processamento do formulário de cadastro
@app.route('/cadastrar', methods=['POST'])
def cadastrar():
    # obtém as informações do formulário
    nome = request.form['nome']
    data_nascimento = request.form['data_nascimento']
    endereco = request.form['endereco']

    # calcula a idade a partir da data de nascimento
    data_nascimento = datetime.strptime(data_nascimento, '%Y-%m-%d')
    hoje = datetime.today()
    idade = hoje.year - data_nascimento.year - ((hoje.month, hoje.day) < (data_nascimento.month, data_nascimento.day))

    # obtém a localização a partir do endereço
    location = geolocator.geocode(endereco)

    # insere as informações no banco de dados
    pessoa = {