# Podcast

Podcast application

- **Importmap** for JavaScript (no bundler required)
- **TailwindCSS** for styling
- **PostgreSQL** as the database
- **Solid Cable** for WebSockets
- **Solid Cache** for caching
- **Solid Queue** for background jobs
- **Rails 8 built-in authentication** (`bin/rails generate authentication`)

---

## 🚀 Requirements

- Ruby 3.3+
- Rails 8.0+
- PostgreSQL 17.2+
- Docker
- Redis (optional, if you want to use ActionCable adapters instead of Solid Cable)

---

## ⚙️ Setup

1. **Clone the repository**

```bash
git clone https://github.com/dambar08/podcast.git
cd podcast
```

## Development

1. **Setup docker services**

```bash
docker compose -f docker/services.yml up -d
```

## Command

docker compose -f docker/services.yml up -d
docker compose -f docker/services.yml down
