# GopherSocial

**GopherSocial** is a backend engineering project built with Go, designed to serve as a modular and scalable backend for a social networking platform. It includes essential features like user authentication, post management, Redis caching, metrics collection, and more — ideal for learning and extending into production-ready applications.

---

## 🚀 Features

- ✅ User authentication & authorization
- 📝 Create, Read, Update, Delete (CRUD) operations for posts
- 📰 Personalized user feeds
- 📧 Email notification system
- 🛡️ Rate limiting (using Redis)
- ⚡ Redis-based caching
- 📄 Swagger auto-generated API documentation
- 🧹 Graceful server shutdown
- 📚 Structured logging (via Zap)
- 🔍 Pagination and filtering support
- 🌐 CORS configuration


---

## 🛠️ Tech Stack

- **Language**: Go (Golang)
- **Database**: PostgreSQL
- **Caching**: Redis
- **Containerization**: Docker & Docker Compose
- **API Docs**: Swagger (OpenAPI)
- **Logging**: Uber Zap
- **Testing Tool**: autocannon

---

## 📦 Getting Started

### Prerequisites

- [Go](https://golang.org/dl/) v1.22 or higher
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Node.js](https://nodejs.org/) (for load testing with `autocannon`)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/avdhendra/TweetPost.git
   cd TweetPost
* Run the application with Docker Compose:

```
docker-compose up --build
```
* The application will start at:
```
http://localhost:8080
```
🧪 Testing the Rate Limiter
Use autocannon to test the rate-limiting feature:

```
npx autocannon -r 22 -d 1 -c 1 --renderStatusCodes http://localhost:8080/v1/health
```
This simulates a burst of requests to observe rate-limiting behavior.

📁 Project Structure

TweetPost
```├── cmd/ # Application entry point
├── internal/ # Core business logic
│ ├── handler/ # HTTP handlers
│ ├── middleware/ # Middleware logic
│ ├── model/ # Data models
│ ├── service/ # Business services
│ └── config/ # App configuration
├── web/ # frontend 
├── scripts/ # DB init scripts, utility scripts
├── docs/ # Swagger documentation and diagrams
├── Dockerfile # Docker container definition
├── docker-compose.yml # Multi-container setup for development
└── Makefile # Automation commands
```

📘 API Documentation
Swagger UI is available at:


```
http://localhost:8080/swagger/index.html
```
Use this to interactively explore the API endpoints and their request/response schemas.

🧰 Makefile Commands
You can run development tasks via make:

```
make seed       # seed data 
make test       # Run all tests
make migrate-create       # create migration schema
make migrate-up  
make migrate-down        
```