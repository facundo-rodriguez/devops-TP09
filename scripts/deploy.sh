#!/bin/bash
# Subimos un nivel para encontrar la carpeta manifests
kubectl apply -f ../manifests/base/namespace.yml
kubectl apply -f ../manifests/db/secrets.yml -n tp09-facundo
kubectl apply -f ../manifests/backend/configmap.yml -n tp09-facundo
kubectl apply -f ../manifests/backend/backend.yml -n tp09-facundo
kubectl apply -f ../manifests/frontend/frontend.yml -n tp09-facundo

echo "Despliegue completado con éxito en el namespace tp09-facundo."