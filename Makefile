PYTHON=python3
VENV=.venv
PIP=$(VENV)/bin/pip
FLASK=$(VENV)/bin/flask

.DEFAULT_GOAL := help

help:
	@echo "make venv / install / run / freeze / clean"

venv:
	$(PYTHON) -m venv $(VENV)

install: venv
	@if [ -f requirements.txt ]; then \
		$(PIP) install -r requirements.txt; \
	else \
		echo "Pas de requirements.txt — installation minimale Flask"; \
		$(PIP) install flask; \
	fi

run: install
	FLASK_APP=app.py FLASK_ENV=development $(FLASK) run --host=0.0.0.0 --port=5000

freeze:
	$(PIP) freeze > requirements.txt

clean:
	rm -rf $(VENV)
