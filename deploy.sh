docker build -t test/multi-client -f ./client/Dockerfile ./client
docker build -t test/multi-server -f ./server/Dockerfile ./server
docker build -t test/multi-worker -f ./worker/Dockerfile ./worker
docker push test/multi-client
docker push test/multi-server
docker push test/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=test/multi-server