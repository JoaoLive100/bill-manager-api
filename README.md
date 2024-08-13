# QueroCode 2024 Bill Manager Project

The Bill Manager Project is an API developed to simulate a system for managing tuition fees paid by students to an educational institution. This API was created as part of a technical challenge with the goal of providing a robust and efficient solution for managing information related to educational institutions, students, enrollments, and invoices.

## Technologies Used

- **Ruby on Rails**: Framework used to develop the API.
- **PostgreSQL**: Database used to store the application's data.
- **Git**: Version control system used to version the source code.
- **GitHub**: Code hosting platform used to store the project repository.

## Ruby Gems

- **Faker**: Faker gem for fake data generating. 
- **Rubocop**: Ruby static code analyzer and formatter.
- **Pg**: PostgreSQL gem for database configuration.
- **Kaminari**: Kaminari gem for request pagination 
- **Dotenv**: Env credential access

## Prerequisites

Before running the application locally, ensure the following software is installed on your machine:

- Ruby
- Ruby on Rails
- PostgreSQL

## Docker Setup

Documentation here.

## Installation

Follow the instructions below to set up and run the project locally:

1. **Clone the repository:**

```bash
git clone https://github.com/JoaoLive100/bill-manager-api.git
cd bill-manager-api
```

2. **Install dependencies:**

```bash
bundle install
```

3. **Configure the database:**

```bash
rails db:create
rails db:migrate
rails db:seed
```

4. **Start the server:**

```bash
rails server
```

5. **Access the API:**

Open a web browser and go to `http://localhost:3000` or use tools like Postman to send HTTP requests to the API.