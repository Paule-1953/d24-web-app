apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app-deployment
  namespace: default
  labels:
    app: web-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: web-app
  template:
    metadata:
      labels:
        app: web-app
    spec:
      containers:
      - name: web-app
        image: pschnurbus24/web-app:0.4
        ports:
        - containerPort: 8080
        resources:
          requests:
            cpu: "200m"
            memory: "256M"
          limits:
            cpu: "400m"
            memory: "512M"
        livenessProbe:
          httpGet:
            path: /healthz
            port: 8080
          initialDelaySeconds: 30
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: /readyz
            port: 8080
          initialDelaySeconds: 5
          periodSeconds: 5
      - name: prometheus-exporter
        image: prom/statsd-exporter:latest
        ports:
        - containerPort: 9102
        resources:
          requests:
            cpu: "100m"
            memory: "128M"
          limits:
            cpu: "200m"
            memory: "256M"
        args:
        - --statsd.mapping-config=/etc/statsd/mapping.conf
        volumeMounts:
        - name: config-volume
          mountPath: /etc/statsd
      volumes:
      - name: config-volume
        configMap:
          name: statsd-mapping-config