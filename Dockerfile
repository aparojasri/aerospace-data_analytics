# ---- Base Image ----
FROM python:3.9-slim

# ---- Set Working Directory ----
WORKDIR /app

# ---- Install Dependencies ----
# Copy only requirements first to leverage Docker cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ---- Copy Application Code & Model ----
COPY main.py .
COPY propeller_model_pipeline.pkl .

# ---- Expose Port ----
EXPOSE 8000

# ---- Run the App ----
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
