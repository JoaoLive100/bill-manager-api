# Usar uma imagem base do Ruby
FROM ruby:3.3.0

# Instalar dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Definir o diretório de trabalho
WORKDIR /bill-manager-api

# Adicionar o Gemfile e Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Instalar gems
RUN bundle install

# Adicionar o código da aplicação
COPY . .

# Expor a porta que a aplicação irá rodar
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["rails", "server", "-b", "0.0.0.0"]