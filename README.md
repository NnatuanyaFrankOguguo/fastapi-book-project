# FastAPI Book Management API

## Overview

This project is a RESTful API built with FastAPI for managing a book collection. It provides comprehensive CRUD (Create, Read, Update, Delete) operations for books with proper error handling, input validation, and documentation.

## Features

- 📚 Book management (CRUD operations)
- ✅ Input validation using Pydantic models
- 🔍 Enum-based genre classification
- 🧪 Complete test coverage
- 📝 API documentation (auto-generated by FastAPI)
- 🔒 CORS middleware enabled

## Project Structure

```
fastapi-book-project/
├── api/
│   ├── db/
│   │   ├── __init__.py
│   │   └── schemas.py      # Data models and in-memory database
│   ├── routes/
│   │   ├── __init__.py
│   │   └── books.py        # Book route handlers
│   └── router.py           # API router configuration
├── core/
│   ├── __init__.py
│   └── config.py           # Application settings
├── tests/
│   ├── __init__.py
│   └── test_books.py       # API endpoint tests
├── main.py                 # Application entry point
├── requirements.txt        # Project dependencies
└── README.md
```

## Technologies Used

- Python 3.12
- FastAPI
- Pydantic
- pytest
- uvicorn

## Installation

1. Clone the repository:

```bash
git clone https://github.com/hng12-devbotops/fastapi-book-project.git
cd fastapi-book-project
```

2. Create a virtual environment:

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:

```bash
pip install -r requirements.txt
```

## Running the Application

1. Start the server:

```bash
uvicorn main:app
```

2. Access the API documentation:

- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## API Endpoints

### Books

- `GET /api/v1/books/` - Get all books
- `GET /api/v1/books/{book_id}` - Get a specific book
- `POST /api/v1/books/` - Create a new book
- `PUT /api/v1/books/{book_id}` - Update a book
- `DELETE /api/v1/books/{book_id}` - Delete a book

### Health Check

- `GET /healthcheck` - Check API status

## Book Schema

```json
{
  "id": 1,
  "title": "Book Title",
  "author": "Author Name",
  "publication_year": 2024,
  "genre": "Fantasy"
}
```

Available genres:

- Science Fiction
- Fantasy
- Horror
- Mystery
- Romance
- Thriller

## Running Tests

```bash
pytest
```

## Error Handling

The API includes proper error handling for:

- Non-existent books
- Invalid book IDs
- Invalid genre types
- Malformed requests

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support, please open an issue in the GitHub repository.


# FastAPI Book API

This project is a FastAPI-based book management API. It provides endpoints to retrieve and manage books.

## Features
- Retrieve book details by ID
- List all books
- CI/CD pipeline for automated testing and deployment

---

## Setup Instructions
### Prerequisites
Ensure you have the following installed:
- Python 3.10+
- FastAPI
- PostgreSQL (if using a database)
- Git
- Nginx (for deployment)

### Installation
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
   ```

2. **Create a Virtual Environment and Install Dependencies:**
   ```sh
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   pip install -r requirements.txt
   ```

3. **Set Up Environment Variables:**
   Create a `.env` file and add necessary environment variables:
   ```env
   DATABASE_URL=postgresql://user:password@localhost/dbname
   SECRET_KEY=your_secret_key
   ```

4. **Run Database Migrations (If Using SQLAlchemy Alembic):**
   ```sh
   alembic upgrade head
   ```

5. **Start the Development Server:**
   ```sh
   uvicorn main:app --reload
   ```
   Access API docs at `http://127.0.0.1:8000/docs`

---

## Deployment Instructions
### 1. Configure Nginx
- Create an Nginx configuration file for FastAPI:
  ```nginx
  server {
      listen 80;
      server_name your_domain_or_ip;

      location / {
          proxy_pass http://127.0.0.1:8000;
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
      }
  }
  ```
- Restart Nginx:
  ```sh
  sudo systemctl restart nginx
  ```

### 2. Set Up CI/CD
#### **GitHub Actions for CI/CD**
- Create a `.github/workflows/deploy.yml` file:
  ```yaml
  name: Deploy FastAPI App

  on:
    push:
      branches:
        - main

  jobs:
    deploy:
      runs-on: ubuntu-latest
      steps:
        - name: SSH into server and deploy
          uses: appleboy/ssh-action@master
          with:
            host: ${{ secrets.SERVER_IP }}
            username: ${{ secrets.SERVER_USER }}
            key: ${{ secrets.SSH_PRIVATE_KEY }}
            script: |
              cd /path/to/your/project
              git pull origin main
              source venv/bin/activate
              pip install -r requirements.txt
              systemctl restart fastapi
  ```
- Store your SSH key as a GitHub secret under **Settings → Secrets and Variables → Actions**

### 3. Running the Application on the Server
- Start the FastAPI app:
  ```sh
  uvicorn main:app --host 0.0.0.0 --port 8000 --reload
  ```
- Access the deployed API at `http://your_domain_or_ip/`

---

## Testing
Run tests using:
```sh
pytest
```

---

## API Endpoints
| Method | Endpoint               | Description                |
|--------|------------------------|----------------------------|
| GET    | /api/v1/books/{book_id} | Get a book by its ID      |
| GET    | /api/v1/books          | List all books            |

---

## Author
**Your Name**  
GitHub: [your-username](https://github.com/your-username)


