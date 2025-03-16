apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-statsd-mapping-config
  namespace: {{ .Values.namespace | default "default" }}
data:
  mapping.conf: |
    mappings:
    - match: "http_requests_total"
      name: "http_requests_total"
      labels:
        app: "{{ .Values.appName | default "web-app" }}"