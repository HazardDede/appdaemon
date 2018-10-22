FROM python:3.6

# Mount extra apps and app.yaml
# Will be copied to the correct path
VOLUME /apps

# Mount dashboard config files
# Will be copied to the correct path
VOLUME /dashboards

# API Url
EXPOSE 5000
# Dashboard Url
EXPOSE 5050

# Environment vars we can configure against
# But these are optional, so we won't define them now
#ENV API_KEY secret_key
#ENV HA_URL http://hass:8123
#ENV HA_KEY secret_key
#ENV DASH_URL http://hass:5050
#ENV EXTRA_CMD -D DEBUG

# Copy appdaemon into image
RUN mkdir -p /appdaemon
WORKDIR /appdaemon
COPY . .

# Install
RUN pip3 install -r requirements.txt

# Start script
RUN chmod +x ./entrypoint.sh
CMD [ "./entrypoint.sh" ]