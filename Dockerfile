# ---------------- BUILDER STAGE ----------------

FROM python:3.11-slim AS builder

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && \
    apt-get install -y gcc libpq-dev && \
    rm -rf /var/lib/apt/lists/*

COPY app/requirements.txt .

RUN pip install --upgrade pip

RUN pip install --prefix=/install --no-cache-dir -r requirements.txt


# ---------------- RUNTIME STAGE ----------------

FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && \
    apt-get install -y curl libpq5 && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m appuser

COPY --from=builder /install /usr/local

COPY app/ .

RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
CMD curl -f http://localhost:8000/health || exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]