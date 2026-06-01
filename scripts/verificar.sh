#!/bin/bash
NAMESPACE="tp09-facundo"

echo "=== ESTADO DEL NAMESPACE: $NAMESPACE ==="
kubectl get ns $NAMESPACE

echo ""
echo "=== ESTADO DE LOS PODS ==="
kubectl get pods -n $NAMESPACE

echo ""
echo "=== ESTADO DE LOS SERVICIOS ==="
kubectl get svc -n $NAMESPACE

echo ""
echo "=== VERIFICACIÓN DE CONEXIÓN AL BACKEND ==="
# Tomamos el nombre de uno de los pods de backend y vemos su log
POD_NAME=$(kubectl get pods -n $NAMESPACE -l app=backend -o jsonpath="{.items[0].metadata.name}")
echo "Revisando logs de: $POD_NAME"
kubectl logs $POD_NAME -n $NAMESPACE | tail -n 5

echo ""
echo "=== CONFIGURACIÓN DE LOS SECRETOS (BASE64) ==="
kubectl get secret mysql-clever-secrets -n $NAMESPACE -o yaml | grep "DB_HOST"

echo ""
echo "Verificación finalizada."
