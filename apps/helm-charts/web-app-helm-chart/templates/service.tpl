apiVersion: v1
kind: Service
metadata:
  name: web-app-service
  namespace: default
  labels:
    app: web-app
spec:
  selector:
    app: web-app
  ports:
    - name: http
      protocol: TCP
      port: 8080
      targetPort: 8080
    - name: metrics
      protocol: TCP
      port: 9102
      targetPort: 9102